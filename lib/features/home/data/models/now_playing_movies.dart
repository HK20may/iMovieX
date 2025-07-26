import 'package:hive/hive.dart';
import 'package:inshorts_movies/features/home/data/models/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'now_playing_movies.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class NowPlayingMovies {
  @HiveField(0)
  final Dates? dates;
  @HiveField(1)
  final int page;
  @HiveField(2)
  final List<Movie> results;
  @HiveField(3)
  @JsonKey(name: "total_pages")
  final int totalPages;
  @HiveField(4)
  @JsonKey(name: "total_results")
  final int totalResults;

  NowPlayingMovies({
    this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory NowPlayingMovies.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingMoviesFromJson(json);
  Map<String, dynamic> toJson() => _$NowPlayingMoviesToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Dates {
  @HiveField(0)
  final String maximum;
  @HiveField(1)
  final String minimum;

  Dates({required this.maximum, required this.minimum});

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
  Map<String, dynamic> toJson() => _$DatesToJson(this);
}
