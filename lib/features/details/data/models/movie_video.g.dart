// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_video.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieVideoResponseAdapter extends TypeAdapter<MovieVideoResponse> {
  @override
  final int typeId = 16;

  @override
  MovieVideoResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieVideoResponse(
      results: (fields[0] as List).cast<MovieVideo>(),
    );
  }

  @override
  void write(BinaryWriter writer, MovieVideoResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVideoResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MovieVideoAdapter extends TypeAdapter<MovieVideo> {
  @override
  final int typeId = 17;

  @override
  MovieVideo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieVideo(
      key: fields[0] as String,
      name: fields[1] as String,
      site: fields[2] as String,
      type: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieVideo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.site)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVideoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideoResponse _$MovieVideoResponseFromJson(Map<String, dynamic> json) =>
    MovieVideoResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieVideoResponseToJson(MovieVideoResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

MovieVideo _$MovieVideoFromJson(Map<String, dynamic> json) => MovieVideo(
      key: json['key'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$MovieVideoToJson(MovieVideo instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'site': instance.site,
      'type': instance.type,
    };
