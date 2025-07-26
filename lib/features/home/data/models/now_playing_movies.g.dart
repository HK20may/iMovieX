// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_movies.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NowPlayingMoviesAdapter extends TypeAdapter<NowPlayingMovies> {
  @override
  final int typeId = 1;

  @override
  NowPlayingMovies read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NowPlayingMovies(
      dates: fields[0] as Dates?,
      page: fields[1] as int,
      results: (fields[2] as List).cast<Movie>(),
      totalPages: fields[3] as int,
      totalResults: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NowPlayingMovies obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.dates)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(2)
      ..write(obj.results)
      ..writeByte(3)
      ..write(obj.totalPages)
      ..writeByte(4)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NowPlayingMoviesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DatesAdapter extends TypeAdapter<Dates> {
  @override
  final int typeId = 2;

  @override
  Dates read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dates(
      maximum: fields[0] as String,
      minimum: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Dates obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.maximum)
      ..writeByte(1)
      ..write(obj.minimum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPlayingMovies _$NowPlayingMoviesFromJson(Map<String, dynamic> json) =>
    NowPlayingMovies(
      dates: json['dates'] == null
          ? null
          : Dates.fromJson(json['dates'] as Map<String, dynamic>),
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$NowPlayingMoviesToJson(NowPlayingMovies instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

Dates _$DatesFromJson(Map<String, dynamic> json) => Dates(
      maximum: json['maximum'] as String,
      minimum: json['minimum'] as String,
    );

Map<String, dynamic> _$DatesToJson(Dates instance) => <String, dynamic>{
      'maximum': instance.maximum,
      'minimum': instance.minimum,
    };
