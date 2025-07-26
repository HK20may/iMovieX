import 'package:inshorts_movies/core/constants/api_urls.dart';
import 'package:inshorts_movies/features/details/data/models/movie_details.dart';
import 'package:inshorts_movies/features/details/data/models/movie_video.dart';
import 'package:inshorts_movies/features/home/data/models/now_playing_movies.dart';
import 'package:inshorts_movies/features/home/data/models/trending_movies.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // GET /movie/now_playing?language=en-US&page=1
  @GET(ApiEndPoint.NOW_PLAYING_MOVIES)
  Future<NowPlayingMovies> getNowPlayingMovies({
    @Query("language") String language = "en-US",
    @Query("page") int page = 1,
  });

  // GET /trending/movie/{time_window}?language=en-US
  @GET("${ApiEndPoint.TRENDING_MOVIES}/{time_window}")
  Future<TrendingMovies> getTrendingMovies({
    @Path("time_window") String timeWindow = "week",
    @Query("language") String language = "en-US",
  });

  @GET('/movie/{movie_id}')
  Future<MovieDetails> getMovieDetails({
    @Path('movie_id') required int movieId,
    @Query('language') String language = 'en-US',
  });

  @GET('/movie/{movie_id}/videos')
  Future<MovieVideoResponse> getMovieVideos({
    @Path('movie_id') required int movieId,
    @Query('language') String language = 'en-US',
  });

  @GET('/search/movie')
  Future<NowPlayingMovies> searchMovies({
    @Query('query') required String query,
    @Query('include_adult') bool includeAdult = false,
    @Query('language') String language = 'en-US',
    @Query('page') int page = 1,
  });
}
