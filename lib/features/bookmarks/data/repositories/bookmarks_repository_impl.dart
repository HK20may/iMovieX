import 'package:injectable/injectable.dart';

import '../../domain/repositories/bookmarks_repository.dart';
import '../datasources/bookmarks_local_data_source.dart';
import '../models/bookmark.dart';

@Injectable(as: BookmarksRepository)
class BookmarksRepositoryImpl implements BookmarksRepository {
  final BookmarksLocalDataSource localDataSource;

  BookmarksRepositoryImpl(this.localDataSource);

  @override
  Future<void> addBookmark(Bookmark bookmark) async {
    await localDataSource.addBookmark(bookmark);
  }

  @override
  Future<void> removeBookmark(int id) async {
    await localDataSource.removeBookmark(id);
  }

  @override
  List<Bookmark> getBookmarks() {
    return localDataSource.getBookmarks();
  }

  @override
  bool isBookmarked(int id) {
    return localDataSource.isBookmarked(id);
  }
}
