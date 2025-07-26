import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshorts_movies/features/home/data/models/movie.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';
import 'package:inshorts_movies/features/home/domain/usecases/movies_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final MoviesUsecase usecase;
  HomeCubit({required this.usecase}) : super(HomeInitial()) {
    fetchMoviesData();
  }

  late NowPlayingMovies nowPlayingMovies;

  List<Movie> nowPlayingMoviesList = [];
  List<Movie> trendingMoviesList = [];

  int nowPlayingPageNumber = 1;

  /// this variables will not allow any other request if there is already an
  /// existing request.
  bool _isAlreadyFetchingNowPlaying = false;

  /// this bool handles the case when we reach at the bottom
  /// of the list. At that point it becomes true.
  bool _shouldPausePaginationForNowPlaying = false;

  /// fetching all movies data concurrently
  Future<void> fetchMoviesData() async {
    emit(HomeLoading());
    try {
      await Future.wait([_getNowPlayingMovies(), _getTrendingMovies()]);
      emit(HomeInitial());
    } catch (e) {
      // ErrorReporter.error(e, stackTrace: st, errorMsg: "❌ Error: ");
      emit(HomeError());
    }
  }

  ///fetching now playing movies data
  Future<void> _getNowPlayingMovies() async {
    try {
      nowPlayingMovies = await usecase.getNowPlayingMovies(
        page: nowPlayingPageNumber,
      );
      nowPlayingPageNumber = 2;
      nowPlayingMoviesList = nowPlayingMovies.results;
    } catch (e, st) {
      throw (e, st);
    }
  }

  ///fetching top rated movies data
  Future<void> _getTrendingMovies() async {
    try {
      trendingMoviesList = await usecase.getTrendingMovies();
    } catch (e, st) {
      throw (e, st);
    }
  }

  /// fetches now playing movies by pagination
  Future<void> getPaginationNowPlayingMovies() async {
    if ((_shouldPausePaginationForNowPlaying || _isAlreadyFetchingNowPlaying)) {
      return;
    }
    _isAlreadyFetchingNowPlaying = true;
    emit(NowPlayingPaginationLoading());
    try {
      nowPlayingMovies = await usecase.getNowPlayingMovies(
        page: nowPlayingPageNumber,
      );

      var responseList = nowPlayingMovies.results;
      if (responseList.isNotEmpty) {
        nowPlayingMoviesList.addAll(responseList);
      }

      nowPlayingPageNumber += 1;

      if (nowPlayingPageNumber >= (nowPlayingMovies.totalPages)) {
        _shouldPausePaginationForNowPlaying = true;
      }
    } catch (e) {
      // ErrorReporter.error(e, stackTrace: st, errorMsg: "❌ Error: ");
    }
    _isAlreadyFetchingNowPlaying = false;
    emit(HomeInitial());
  }
}
