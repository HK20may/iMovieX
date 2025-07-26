// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsAdapter extends TypeAdapter<MovieDetails> {
  @override
  final int typeId = 11;

  @override
  MovieDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetails(
      id: fields[0] as int,
      title: fields[1] as String?,
      overview: fields[2] as String?,
      posterPath: fields[3] as String?,
      backdropPath: fields[4] as String?,
      voteAverage: fields[5] as double?,
      voteCount: fields[6] as int?,
      runtime: fields[7] as int?,
      releaseDate: fields[8] as String?,
      genres: (fields[9] as List?)?.cast<Genre>(),
      originalLanguage: fields[10] as String?,
      status: fields[11] as String?,
      tagline: fields[12] as String?,
      adult: fields[13] as bool?,
      belongsToCollection: fields[14] as dynamic,
      budget: fields[15] as int,
      homepage: fields[16] as String?,
      imdbId: fields[17] as String?,
      originCountry: (fields[18] as List?)?.cast<String>(),
      originalTitle: fields[19] as String?,
      popularity: fields[20] as double?,
      productionCompanies: (fields[21] as List?)?.cast<ProductionCompany>(),
      productionCountries: (fields[22] as List?)?.cast<ProductionCountry>(),
      revenue: fields[23] as int?,
      spokenLanguages: (fields[24] as List?)?.cast<SpokenLanguage>(),
      video: fields[25] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetails obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.backdropPath)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.voteCount)
      ..writeByte(7)
      ..write(obj.runtime)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.genres)
      ..writeByte(10)
      ..write(obj.originalLanguage)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.tagline)
      ..writeByte(13)
      ..write(obj.adult)
      ..writeByte(14)
      ..write(obj.belongsToCollection)
      ..writeByte(15)
      ..write(obj.budget)
      ..writeByte(16)
      ..write(obj.homepage)
      ..writeByte(17)
      ..write(obj.imdbId)
      ..writeByte(18)
      ..write(obj.originCountry)
      ..writeByte(19)
      ..write(obj.originalTitle)
      ..writeByte(20)
      ..write(obj.popularity)
      ..writeByte(21)
      ..write(obj.productionCompanies)
      ..writeByte(22)
      ..write(obj.productionCountries)
      ..writeByte(23)
      ..write(obj.revenue)
      ..writeByte(24)
      ..write(obj.spokenLanguages)
      ..writeByte(25)
      ..write(obj.video);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenreAdapter extends TypeAdapter<Genre> {
  @override
  final int typeId = 12;

  @override
  Genre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Genre(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Genre obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductionCompanyAdapter extends TypeAdapter<ProductionCompany> {
  @override
  final int typeId = 13;

  @override
  ProductionCompany read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCompany(
      id: fields[0] as int,
      logoPath: fields[1] as String?,
      name: fields[2] as String,
      originCountry: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCompany obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.logoPath)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.originCountry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductionCountryAdapter extends TypeAdapter<ProductionCountry> {
  @override
  final int typeId = 14;

  @override
  ProductionCountry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionCountry(
      iso31661: fields[0] as String,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionCountry obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.iso31661)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionCountryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpokenLanguageAdapter extends TypeAdapter<SpokenLanguage> {
  @override
  final int typeId = 15;

  @override
  SpokenLanguage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpokenLanguage(
      englishName: fields[0] as String?,
      iso6391: fields[1] as String?,
      name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SpokenLanguage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.englishName)
      ..writeByte(1)
      ..write(obj.iso6391)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpokenLanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      runtime: (json['runtime'] as num?)?.toInt(),
      releaseDate: json['release_date'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      originalLanguage: json['original_language'] as String?,
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      adult: json['adult'] as bool?,
      belongsToCollection: json['belongs_to_collection'],
      budget: (json['budget'] as num).toInt(),
      homepage: json['homepage'] as String?,
      imdbId: json['imdb_id'] as String?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      originalTitle: json['original_title'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
      revenue: (json['revenue'] as num?)?.toInt(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      video: json['video'] as bool?,
    );

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'runtime': instance.runtime,
      'release_date': instance.releaseDate,
      'genres': instance.genres?.map((e) => e.toJson()).toList(),
      'original_language': instance.originalLanguage,
      'status': instance.status,
      'tagline': instance.tagline,
      'adult': instance.adult,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'homepage': instance.homepage,
      'imdb_id': instance.imdbId,
      'origin_country': instance.originCountry,
      'original_title': instance.originalTitle,
      'popularity': instance.popularity,
      'production_companies':
          instance.productionCompanies?.map((e) => e.toJson()).toList(),
      'production_countries':
          instance.productionCountries?.map((e) => e.toJson()).toList(),
      'revenue': instance.revenue,
      'spoken_languages':
          instance.spokenLanguages?.map((e) => e.toJson()).toList(),
      'video': instance.video,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) =>
    ProductionCompany(
      id: (json['id'] as num).toInt(),
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String,
      originCountry: json['origin_country'] as String,
    );

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) =>
    ProductionCountry(
      iso31661: json['iso_3166_1'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProductionCountryToJson(ProductionCountry instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
    };

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    SpokenLanguage(
      englishName: json['english_name'] as String?,
      iso6391: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };
