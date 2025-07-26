import 'package:inshorts_movies/features/home/data/models/movie.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';

abstract class MoviesRepository {
  // NowPlayingMovies returns full response including paging info
  Future<NowPlayingMovies> getNowPlayingMovies({required int page});

  // Trending movies returns list of movies (can be updated similarly if needed)
  Future<List<Movie>> getTrendingMovies({String timeWindow = 'week'});
}
