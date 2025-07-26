import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/core/constants/hive_box.dart';
import '../models/bookmark.dart';

abstract class BookmarksLocalDataSource {
  Future<void> addBookmark(Bookmark bookmark);
  Future<void> removeBookmark(int bookmarkId);
  List<Bookmark> getBookmarks();
  bool isBookmarked(int id);
}

@Injectable(as: BookmarksLocalDataSource)
class BookmarksLocalDataSourceImpl implements BookmarksLocalDataSource {
  Future<Box<Bookmark>> _openBox() async {
    if (Hive.isBoxOpen(HiveBox.bookmarksBoxName)) {
      return Hive.box<Bookmark>(HiveBox.bookmarksBoxName);
    } else {
      return await Hive.openBox<Bookmark>(HiveBox.bookmarksBoxName);
    }
  }

  @override
  Future<void> addBookmark(Bookmark bookmark) async {
    final box = await _openBox();
    await box.put(bookmark.id, bookmark);
  }

  @override
  Future<void> removeBookmark(int bookmarkId) async {
    final box = await _openBox();
    await box.delete(bookmarkId);
  }

  @override
  List<Bookmark> getBookmarks() {
    if (!Hive.isBoxOpen(HiveBox.bookmarksBoxName)) return [];
    final box = Hive.box<Bookmark>(HiveBox.bookmarksBoxName);
    return box.values.toList();
  }

  @override
  bool isBookmarked(int id) {
    if (!Hive.isBoxOpen(HiveBox.bookmarksBoxName)) return false;
    final box = Hive.box<Bookmark>(HiveBox.bookmarksBoxName);
    return box.containsKey(id);
  }
}
