import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshorts_movies/features/bookmarks/data/models/bookmark.dart';
import '../../domain/usecases/bookmarks_usecase.dart';

part 'bookmarks_state.dart';

class BookmarksCubit extends Cubit<BookmarksState> {
  final BookmarksUsecase usecase;

  BookmarksCubit({required this.usecase}) : super(BookmarksInitial());

  void loadBookmarks() {
    emit(BookmarksLoading());
    final bookmarks = usecase.getBookmarks();
    emit(BookmarksLoaded(bookmarks));
  }

  Future<void> addBookmark(Bookmark bookmark) async {
    await usecase.addBookmark(bookmark);
    loadBookmarks();
  }

  Future<void> removeBookmark(int id) async {
    await usecase.removeBookmark(id);
    loadBookmarks();
  }

  bool isBookmarked(int id) {
    return usecase.isBookmarked(id);
  }
}
