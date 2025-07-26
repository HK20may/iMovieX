import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/core/constants/string_constants.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';
import 'package:inshorts_movies/features/search/data/datasources/search_remote_data_source.dart';
import 'package:inshorts_movies/features/search/domain/repositories/search_repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remote;

  SearchRepositoryImpl(this.remote);

  @override
  Future<NowPlayingMovies> searchMovies(String query, {int page = 1}) async {
    final response = await remote.searchMovies(query, page: page);

    for (var result in response.results) {
      if (result.backdropPath != null) {
        result.backdropPath =
            "${StringConstants.imageBaseUrl1}${result.backdropPath}";
      }
    }
    return response;
  }
}
