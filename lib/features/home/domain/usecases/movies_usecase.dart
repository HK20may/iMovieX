import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/features/home/data/models/movie.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';
import 'package:inshorts_movies/features/home/domain/repositories/movies_repository.dart';

@injectable
class MoviesUsecase {
  final MoviesRepository repository;

  MoviesUsecase(this.repository);

  Future<NowPlayingMovies> getNowPlayingMovies({
    required int page,
    bool forceRefresh = false,
  }) {
    return repository.getNowPlayingMovies(page: page);
  }

  Future<List<Movie>> getTrendingMovies({
    String timeWindow = 'week',
    bool forceRefresh = false,
  }) {
    return repository.getTrendingMovies(timeWindow: timeWindow);
  }
}
