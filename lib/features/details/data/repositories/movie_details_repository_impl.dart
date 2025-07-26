import 'package:injectable/injectable.dart';

import '../../domain/repositories/movie_details_repository.dart';
import '../datasources/movie_details_local_data_source.dart';
import '../datasources/movie_details_remote_data_source.dart';
import '../models/movie_details.dart';
import '../models/movie_video.dart';

@Injectable(as: MovieDetailsRepository)
class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailsRemoteDataSource remoteDataSource;
  final MovieDetailsLocalDataSource localDataSource;

  MovieDetailsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    final cached = localDataSource.getCachedMovieDetails(movieId);
    if (cached != null) return cached;
    try {
      final remote = await remoteDataSource.fetchMovieDetails(movieId);

      if (remote.backdropPath != null) {
        remote.backdropPath =
            "http://image.tmdb.org/t/p/w780${remote.backdropPath}";
      }
      await localDataSource.cacheMovieDetails(remote);
      return remote;
    } catch (e) {
      if (cached != null) return cached;
      rethrow;
    }
  }

  @override
  Future<MovieVideoResponse> getMovieVideos(int movieId) async {
    final cached = localDataSource.getCachedMovieVideos(movieId);
    if (cached != null) return cached;
    try {
      final remote = await remoteDataSource.fetchMovieVideos(movieId);
      await localDataSource.cacheMovieVideos(remote, movieId);
      return remote;
    } catch (e) {
      if (cached != null) return cached;
      rethrow;
    }
  }
}
