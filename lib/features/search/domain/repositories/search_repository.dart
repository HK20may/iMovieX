import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';

abstract class SearchRepository {
  Future<NowPlayingMovies> searchMovies(String query, {int page});
}
