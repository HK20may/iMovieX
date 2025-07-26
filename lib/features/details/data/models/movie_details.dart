import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@HiveType(typeId: 11)
@JsonSerializable(explicitToJson: true)
class MovieDetails {
  @HiveField(0)
  @JsonKey(name: "id")
  final int id;

  @HiveField(1)
  @JsonKey(name: "title")
  final String? title;

  @HiveField(2)
  @JsonKey(name: "overview")
  final String? overview;

  @HiveField(3)
  @JsonKey(name: "poster_path")
  final String? posterPath;

  @HiveField(4)
  @JsonKey(name: "backdrop_path")
  String? backdropPath;

  @HiveField(5)
  @JsonKey(name: "vote_average")
  final double? voteAverage;

  @HiveField(6)
  @JsonKey(name: "vote_count")
  final int? voteCount;

  @HiveField(7)
  @JsonKey(name: "runtime")
  final int? runtime;

  @HiveField(8)
  @JsonKey(name: "release_date")
  final String? releaseDate;

  @HiveField(9)
  @JsonKey(name: "genres")
  final List<Genre>? genres;

  @HiveField(10)
  @JsonKey(name: "original_language")
  final String? originalLanguage;

  @HiveField(11)
  @JsonKey(name: "status")
  final String? status;

  @HiveField(12)
  @JsonKey(name: "tagline")
  final String? tagline;

  @HiveField(13)
  @JsonKey(name: "adult")
  final bool? adult;

  @HiveField(14)
  @JsonKey(name: "belongs_to_collection")
  final dynamic belongsToCollection;

  @HiveField(15)
  @JsonKey(name: "budget")
  final int budget;

  @HiveField(16)
  @JsonKey(name: "homepage")
  final String? homepage;

  @HiveField(17)
  @JsonKey(name: "imdb_id")
  final String? imdbId;

  @HiveField(18)
  @JsonKey(name: "origin_country")
  final List<String>? originCountry;

  @HiveField(19)
  @JsonKey(name: "original_title")
  final String? originalTitle;

  @HiveField(20)
  @JsonKey(name: "popularity")
  final double? popularity;

  @HiveField(21)
  @JsonKey(name: "production_companies")
  final List<ProductionCompany>? productionCompanies;

  @HiveField(22)
  @JsonKey(name: "production_countries")
  final List<ProductionCountry>? productionCountries;

  @HiveField(23)
  @JsonKey(name: "revenue")
  final int? revenue;

  @HiveField(24)
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguage>? spokenLanguages;

  @HiveField(25)
  @JsonKey(name: "video")
  final bool? video;

  MovieDetails({
    required this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.voteCount,
    this.runtime,
    this.releaseDate,
    this.genres,
    this.originalLanguage,
    this.status,
    this.tagline,
    this.adult,
    this.belongsToCollection,
    required this.budget,
    this.homepage,
    this.imdbId,
    this.originCountry,
    this.originalTitle,
    this.popularity,
    this.productionCompanies,
    this.productionCountries,
    this.revenue,
    this.spokenLanguages,
    this.video,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

@HiveType(typeId: 12)
@JsonSerializable()
class Genre {
  @HiveField(0)
  @JsonKey(name: "id")
  final int id;

  @HiveField(1)
  @JsonKey(name: "name")
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@HiveType(typeId: 13)
@JsonSerializable()
class ProductionCompany {
  @HiveField(0)
  @JsonKey(name: "id")
  final int id;

  @HiveField(1)
  @JsonKey(name: "logo_path")
  final String? logoPath;

  @HiveField(2)
  @JsonKey(name: "name")
  final String name;

  @HiveField(3)
  @JsonKey(name: "origin_country")
  final String originCountry;

  ProductionCompany({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@HiveType(typeId: 14)
@JsonSerializable()
class ProductionCountry {
  @HiveField(0)
  @JsonKey(name: "iso_3166_1")
  final String iso31661;

  @HiveField(1)
  @JsonKey(name: "name")
  final String name;

  ProductionCountry({required this.iso31661, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@HiveType(typeId: 15)
@JsonSerializable()
class SpokenLanguage {
  @HiveField(0)
  @JsonKey(name: "english_name")
  final String? englishName;

  @HiveField(1)
  @JsonKey(name: "iso_639_1")
  final String? iso6391;

  @HiveField(2)
  @JsonKey(name: "name")
  final String? name;

  SpokenLanguage({this.englishName, this.iso6391, this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
