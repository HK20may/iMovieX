import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/core/constants/hive_box.dart';
import 'package:inshorts_movies/features/home/data/models/movie.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';

abstract class MoviesLocalDataSource {
  Future<void> cacheNowPlayingMovies(NowPlayingMovies movies);
  NowPlayingMovies? getCachedNowPlayingMovies();

  Future<void> cacheTrendingMovies(List<Movie> movies);
  List<Movie> getCachedTrendingMovies();
}

@Injectable(as: MoviesLocalDataSource)
class MoviesLocalDataSourceImpl implements MoviesLocalDataSource {
  @override
  Future<void> cacheNowPlayingMovies(NowPlayingMovies newData) async {
    final box = await Hive.openBox<NowPlayingMovies>(
      HiveBox.nowPlayingMoviesBox,
    );

    final existingData =
        box.get(HiveBox.nowPlayingMoviesBox) ??
        NowPlayingMovies(
          dates: newData.dates,
          page: 1,
          results: [],
          totalPages: newData.totalPages,
          totalResults: newData.totalResults,
        );

    // Append only new movies by id (avoid duplicates):
    final existingIds = existingData.results.map((e) => e.id).toSet();
    final newMovies =
        newData.results.where((m) => !existingIds.contains(m.id)).toList();

    final updatedMovies = List<Movie>.from(existingData.results)
      ..addAll(newMovies);

    final updatedData = NowPlayingMovies(
      dates: newData.dates,
      page: newData.page,
      results: updatedMovies,
      totalPages: newData.totalPages,
      totalResults: newData.totalResults,
    );

    await box.put(HiveBox.nowPlayingMoviesBox, updatedData);
  }

  @override
  NowPlayingMovies? getCachedNowPlayingMovies() {
    final box = Hive.box<NowPlayingMovies>(HiveBox.nowPlayingMoviesBox);
    return box.get(HiveBox.nowPlayingMoviesBox);
  }

  @override
  Future<void> cacheTrendingMovies(List<Movie> movies) async {
    final box = await Hive.openBox<Movie>(HiveBox.trendingMoviesBox);
    await box.clear();
    await box.addAll(movies);
  }

  @override
  List<Movie> getCachedTrendingMovies() {
    if (!Hive.isBoxOpen(HiveBox.trendingMoviesBox)) {
      throw Exception('Trending Hive box is not open.');
    }
    final box = Hive.box<Movie>(HiveBox.trendingMoviesBox);
    return box.values.toList();
  }
}
