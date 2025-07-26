import 'package:hive_flutter/hive_flutter.dart';
import 'package:inshorts_movies/core/constants/hive_box.dart';
import 'package:inshorts_movies/features/bookmarks/data/models/bookmark.dart';
import 'package:inshorts_movies/features/details/data/models/movie_details.dart';
import 'package:inshorts_movies/features/details/data/models/movie_video.dart';
import 'package:inshorts_movies/features/home/data/models/movie.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NowPlayingMoviesAdapter());
  Hive.registerAdapter(DatesAdapter());
  Hive.registerAdapter(MovieAdapter());

  Hive.registerAdapter(MovieDetailsAdapter());
  Hive.registerAdapter(GenreAdapter());
  Hive.registerAdapter(ProductionCompanyAdapter());
  Hive.registerAdapter(ProductionCountryAdapter());
  Hive.registerAdapter(SpokenLanguageAdapter());

  Hive.registerAdapter(MovieVideoAdapter());
  Hive.registerAdapter(MovieVideoResponseAdapter());
  Hive.registerAdapter(BookmarkAdapter());

  await Hive.openBox<NowPlayingMovies>(HiveBox.nowPlayingMoviesBox);
  await Hive.openBox<Movie>(HiveBox.trendingMoviesBox);
  await Hive.openBox<MovieDetails>(HiveBox.detailsBox);
  await Hive.openBox<MovieVideoResponse>(HiveBox.videosBox);
  await Hive.openBox<Bookmark>(HiveBox.bookmarksBoxName);
}
