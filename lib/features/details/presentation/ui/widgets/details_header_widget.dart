import 'package:flutter/material.dart';
import 'package:inshorts_movies/features/bookmarks/data/models/bookmark.dart';
import 'package:inshorts_movies/features/bookmarks/presentation/ui/widgets/bookmark_heart_widget.dart';
import 'package:inshorts_movies/features/details/data/models/movie_details.dart';

class DetailsHeaderWidget extends StatelessWidget {
  final MovieDetails details;
  const DetailsHeaderWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            details.title ?? '',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
        BookmarkHeartWidget(
          bookmark: Bookmark(
            id: details.id,
            title: details.title ?? '',
            posterPath: details.posterPath ?? '',
            rating: details.voteAverage ?? 0.0,
            releaseDate: details.releaseDate ?? '',
          ),
        ),
      ],
    );
  }
}
