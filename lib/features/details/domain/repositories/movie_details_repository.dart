import 'package:inshorts_movies/features/details/data/models/movie_details.dart';
import 'package:inshorts_movies/features/details/data/models/movie_video.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetails> getMovieDetails(int movieId);
  Future<MovieVideoResponse> getMovieVideos(int movieId);
}
