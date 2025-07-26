import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/core/network/api_client.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';

abstract class SearchRemoteDataSource {
  Future<NowPlayingMovies> searchMovies(String query, {int page});
}

@Injectable(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiClient apiClient;

  SearchRemoteDataSourceImpl(this.apiClient);

  @override
  Future<NowPlayingMovies> searchMovies(String query, {int page = 1}) async {
    return apiClient.searchMovies(query: query, page: page);
  }
}
