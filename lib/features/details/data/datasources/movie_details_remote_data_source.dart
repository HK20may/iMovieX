import 'package:injectable/injectable.dart';

import '../models/movie_details.dart';
import '../models/movie_video.dart';
import 'package:inshorts_movies/core/network/api_client.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetails> fetchMovieDetails(int movieId);
  Future<MovieVideoResponse> fetchMovieVideos(int movieId);
}

@Injectable(as: MovieDetailsRemoteDataSource)
class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final ApiClient apiClient;
  MovieDetailsRemoteDataSourceImpl(this.apiClient);

  @override
  Future<MovieDetails> fetchMovieDetails(int movieId) =>
      apiClient.getMovieDetails(movieId: movieId);

  @override
  Future<MovieVideoResponse> fetchMovieVideos(int movieId) =>
      apiClient.getMovieVideos(movieId: movieId);
}
