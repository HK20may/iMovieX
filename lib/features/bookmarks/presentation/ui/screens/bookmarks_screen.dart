import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:inshorts_movies/core/widgets/fading_line.dart';
import 'package:inshorts_movies/features/bookmarks/presentation/cubit/bookmarks_cubit.dart';
import 'package:inshorts_movies/features/bookmarks/presentation/ui/widgets/bookmark_card.dart';
import 'package:inshorts_movies/features/bookmarks/presentation/ui/widgets/bookmark_empty_widget.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BookmarksCubit>().loadBookmarks();

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 142, 111, 145), Colors.white],
          ),
        ),
        child: BlocBuilder<BookmarksCubit, BookmarksState>(
          builder: (context, state) {
            if (state is BookmarksLoading || state is BookmarksInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookmarksLoaded) {
              if (state.bookmarks.isEmpty) {
                return const BookmarkEmptyWidget();
              }
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Gap(kToolbarHeight),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Favorites",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gap(16),
                        FadingLine(),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 8,
                      ),
                      itemCount: state.bookmarks.length,
                      separatorBuilder: (ctx, index) => const Gap(12),
                      itemBuilder: (context, index) {
                        final bookmark = state.bookmarks[index];
                        return BookmarkCard(bookmark: bookmark);
                      },
                    ),
                  ),
                ],
              );
            } else if (state is BookmarksError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
