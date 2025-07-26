import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/core/network/api_client.dart';
import 'package:inshorts_movies/features/home/data/models/movie.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';

abstract class MoviesRemoteDataSource {
  Future<NowPlayingMovies> fetchNowPlayingMovies({required int page});
  Future<List<Movie>> fetchTrendingMovies({String timeWindow});
}

@Injectable(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final ApiClient apiClient;

  MoviesRemoteDataSourceImpl(this.apiClient);

  @override
  Future<NowPlayingMovies> fetchNowPlayingMovies({required int page}) async {
    return await apiClient.getNowPlayingMovies(page: page);
  }

  @override
  Future<List<Movie>> fetchTrendingMovies({String timeWindow = 'week'}) async {
    final response = await apiClient.getTrendingMovies(timeWindow: timeWindow);
    return response.results;
  }
}
