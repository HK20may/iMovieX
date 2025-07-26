import 'package:hive/hive.dart';

part 'bookmark.g.dart';

@HiveType(typeId: 20)
class Bookmark extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  @HiveField(3)
  final double rating;

  @HiveField(4)
  final String releaseDate;

  Bookmark({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.rating,
    required this.releaseDate,
  });
}
