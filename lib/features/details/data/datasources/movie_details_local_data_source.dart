import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/core/constants/hive_box.dart';
import '../models/movie_details.dart';
import '../models/movie_video.dart';

abstract class MovieDetailsLocalDataSource {
  Future<void> cacheMovieDetails(MovieDetails details);
  MovieDetails? getCachedMovieDetails(int id);
  Future<void> cacheMovieVideos(MovieVideoResponse videos, int movieId);
  MovieVideoResponse? getCachedMovieVideos(int movieId);
}

@Injectable(as: MovieDetailsLocalDataSource)
class MovieDetailsLocalDataSourceImpl implements MovieDetailsLocalDataSource {
  @override
  Future<void> cacheMovieDetails(MovieDetails details) async {
    final box = await Hive.openBox<MovieDetails>(HiveBox.detailsBox);
    await box.put(details.id, details);
  }

  @override
  MovieDetails? getCachedMovieDetails(int id) {
    final box = Hive.box<MovieDetails>(HiveBox.detailsBox);
    return box.get(id);
  }

  @override
  Future<void> cacheMovieVideos(MovieVideoResponse videos, int movieId) async {
    final box = await Hive.openBox<MovieVideoResponse>(HiveBox.videosBox);
    await box.put(movieId, videos);
  }

  @override
  MovieVideoResponse? getCachedMovieVideos(int movieId) {
    final box = Hive.box<MovieVideoResponse>(HiveBox.videosBox);
    return box.get(movieId);
  }
}
