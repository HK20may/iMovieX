import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Movie extends HiveObject {
  @HiveField(0)
  final bool? adult;

  @HiveField(1)
  @JsonKey(name: "backdrop_path")
  String? backdropPath;

  @HiveField(2)
  @JsonKey(name: "genre_ids")
  final List<int>? genreIds;

  @HiveField(3)
  final int? id;

  @HiveField(4)
  @JsonKey(name: "original_language")
  final String? originalLanguage;

  @HiveField(5)
  @JsonKey(name: "original_title")
  final String? originalTitle;

  @HiveField(6)
  final String? overview;

  @HiveField(7)
  final double? popularity;

  @HiveField(8)
  @JsonKey(name: "poster_path")
  String? posterPath;

  @HiveField(9)
  @JsonKey(name: "release_date")
  final String? releaseDate;

  @HiveField(10)
  final String? title;

  @HiveField(11)
  final bool? video;

  @HiveField(12)
  @JsonKey(name: "vote_average")
  final double? voteAverage;

  @HiveField(13)
  @JsonKey(name: "vote_count")
  final int? voteCount;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
