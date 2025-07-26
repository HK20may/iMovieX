import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/models/movie_details.dart';
import '../../data/models/movie_video.dart';
import '../../domain/usecases/movie_details_usecase.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final int movieId;
  final MovieDetailsUseCase usecase;

  MovieDetailsCubit({required this.movieId, required this.usecase})
    : super(MovieDetailsInitial()) {
    fetchMovieDetails();
  }

  MovieDetails? details;
  MovieVideoResponse? videos;

  Future<void> fetchMovieDetails() async {
    emit(MovieDetailsLoading());
    try {
      final movieDetails = await usecase.getMovieDetails(movieId);
      final movieVideos = await usecase.getMovieVideos(movieId);
      details = movieDetails;
      videos = movieVideos;
      emit(MovieDetailsLoaded(details: movieDetails, videos: movieVideos));
    } catch (e) {
      emit(MovieDetailsError());
    }
  }
}
