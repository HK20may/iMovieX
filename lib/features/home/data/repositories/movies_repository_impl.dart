import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/features/home/data/datasources/movies_local_data_source.dart';
import 'package:inshorts_movies/features/home/data/datasources/movies_remote_data_source.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';
import 'package:inshorts_movies/features/home/data/models/movie.dart';
import 'package:inshorts_movies/features/home/domain/repositories/movies_repository.dart';

class NoCachedDataException implements Exception {
  final String message;
  NoCachedDataException([this.message = "No cached data available"]);
}

@Injectable(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource remoteDataSource;
  final MoviesLocalDataSource localDataSource;

  MoviesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<NowPlayingMovies> getNowPlayingMovies({required int page}) async {
    try {
      // Fetch remote page from API
      final remote = await remoteDataSource.fetchNowPlayingMovies(page: page);

      for (var result in remote.results) {
        if (result.backdropPath != null) {
          result.backdropPath =
              "http://image.tmdb.org/t/p/w780${result.backdropPath}";
        }
      }

      // Cache movies — this method expected to append new page's movies rather than overwrite
      await localDataSource.cacheNowPlayingMovies(remote);

      if (page == 1 && remote.results.isEmpty) {
        throw NoCachedDataException("No movies returned from server");
      }
      return remote;
    } catch (error) {
      // On failure fallback on cache if available
      log("Failed to fetch from server: $error");
      if (page == 1) {
        final cached = localDataSource.getCachedNowPlayingMovies();
        if (cached != null && cached.results.isNotEmpty) {
          return cached;
        }
      }
      throw NoCachedDataException(
        "No cached data and failed to fetch from server",
      );
    }
  }

  @override
  Future<List<Movie>> getTrendingMovies({String timeWindow = 'week'}) async {
    try {
      final remote = await remoteDataSource.fetchTrendingMovies(
        timeWindow: timeWindow,
      );

      for (var result in remote) {
        if (result.posterPath != null) {
          result.posterPath =
              "http://image.tmdb.org/t/p/w780${result.posterPath}";
        }
      }

      await localDataSource.cacheTrendingMovies(remote);
      if (remote.isEmpty) {
        throw NoCachedDataException("No trending movies returned from server");
      }
      return remote;
    } catch (error) {
      log("Failed to fetch from server: $error");
      final cached = localDataSource.getCachedTrendingMovies();
      if (cached.isNotEmpty) return cached;
      throw NoCachedDataException(
        "No cached trending data & failed to fetch from server",
      );
    }
  }
}
