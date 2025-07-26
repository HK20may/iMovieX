import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/features/details/data/models/movie_details.dart';
import 'package:inshorts_movies/features/details/data/models/movie_video.dart';
import '../repositories/movie_details_repository.dart';

@injectable
class MovieDetailsUseCase {
  final MovieDetailsRepository repository;

  MovieDetailsUseCase(this.repository);

  Future<MovieDetails> getMovieDetails(int movieId) {
    return repository.getMovieDetails(movieId);
  }

  Future<MovieVideoResponse> getMovieVideos(int movieId) {
    return repository.getMovieVideos(movieId);
  }
}
