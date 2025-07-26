import 'package:inshorts_movies/features/bookmarks/data/models/bookmark.dart';

abstract class BookmarksRepository {
  Future<void> addBookmark(Bookmark bookmark);
  Future<void> removeBookmark(int id);
  List<Bookmark> getBookmarks();
  bool isBookmarked(int id);
}
