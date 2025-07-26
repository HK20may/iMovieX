import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_video.g.dart';

@HiveType(typeId: 16)
@JsonSerializable()
class MovieVideoResponse {
  @HiveField(0)
  final List<MovieVideo> results;

  MovieVideoResponse({required this.results});

  factory MovieVideoResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieVideoResponseToJson(this);
}

@HiveType(typeId: 17)
@JsonSerializable()
class MovieVideo {
  @HiveField(0)
  final String key;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String site;
  @HiveField(3)
  final String type;

  MovieVideo({
    required this.key,
    required this.name,
    required this.site,
    required this.type,
  });

  factory MovieVideo.fromJson(Map<String, dynamic> json) =>
      _$MovieVideoFromJson(json);
  Map<String, dynamic> toJson() => _$MovieVideoToJson(this);
}
