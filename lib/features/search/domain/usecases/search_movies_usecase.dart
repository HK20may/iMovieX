import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';
import 'package:inshorts_movies/features/search/domain/repositories/search_repository.dart';

@injectable
class SearchMoviesUsecase {
  final SearchRepository repo;
  SearchMoviesUsecase(this.repo);

  Future<NowPlayingMovies> call(String query, {int page = 1}) {
    return repo.searchMovies(query, page: page);
  }
}
