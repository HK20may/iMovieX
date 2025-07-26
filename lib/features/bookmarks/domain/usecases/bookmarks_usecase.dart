import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/features/bookmarks/data/models/bookmark.dart';

import '../repositories/bookmarks_repository.dart';

@injectable
class BookmarksUsecase {
  final BookmarksRepository repository;

  BookmarksUsecase(this.repository);

  Future<void> addBookmark(Bookmark bookmark) {
    return repository.addBookmark(bookmark);
  }

  Future<void> removeBookmark(int id) {
    return repository.removeBookmark(id);
  }

  List<Bookmark> getBookmarks() {
    return repository.getBookmarks();
  }

  bool isBookmarked(int id) {
    return repository.isBookmarked(id);
  }
}
