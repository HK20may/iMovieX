import 'package:inshorts_movies/features/home/data/models/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trending_movies.g.dart';

@JsonSerializable()
class TrendingMovies {
  final int page;
  final List<Movie> results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  TrendingMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TrendingMovies.fromJson(Map<String, dynamic> json) =>
      _$TrendingMoviesFromJson(json);
  Map<String, dynamic> toJson() => _$TrendingMoviesToJson(this);
}
