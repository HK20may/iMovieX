import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshorts_movies/features/home/data/models/movie.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';
import 'package:inshorts_movies/features/search/domain/usecases/search_movies_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMoviesUsecase usecase;
  SearchCubit({required this.usecase}) : super(SearchInitial());

  late NowPlayingMovies searchResult;

  String query = "";

  List<Movie> searchMoviesList = [];

  int pageNumber = 1;

  /// this variables will not allow any other request if there is already an
  /// existing request.
  bool _isAlreadyFetching = false;

  /// this bool handles the case when we reach at the bottom
  /// of the list. At that point it becomes true.
  bool _shouldPausePagination = false;

  /// fetching all movies data concurrently
  Future<void> fetchSearchResult() async {
    emit(SearchLoading());
    try {
      searchResult = await usecase.call(query, page: pageNumber);
      pageNumber = 2;
      searchMoviesList = searchResult.results;
      emit(SearchLoaded(searchMoviesList));
    } catch (e) {
      // ErrorReporter.error(e, stackTrace: st, errorMsg: "❌ Error: ");
      emit(SearchError());
    }
  }

  /// fetches search results by pagination
  Future<void> getPaginationForSearch() async {
    if ((_shouldPausePagination || _isAlreadyFetching)) {
      return;
    }
    _isAlreadyFetching = true;
    emit(SearchPaginationLoading());
    try {
      searchResult = await usecase.call(query, page: pageNumber);

      var responseList = searchResult.results;
      if (responseList.isNotEmpty) {
        searchMoviesList.addAll(responseList);
      }

      pageNumber += 1;

      if (pageNumber >= (searchResult.totalPages)) {
        _shouldPausePagination = true;
      }
    } catch (e) {
      // ErrorReporter.error(e, stackTrace: st, errorMsg: "❌ Error: ");
    }
    _isAlreadyFetching = false;
    emit(SearchLoaded(searchMoviesList));
  }
}
