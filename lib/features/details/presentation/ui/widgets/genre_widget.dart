import 'package:flutter/material.dart';
import 'package:inshorts_movies/features/details/data/models/movie_details.dart';

class GenreWidget extends StatelessWidget {
  final MovieDetails details;
  const GenreWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children:
          details.genres
              ?.map(
                (g) => Chip(
                  label: Text(
                    g.name,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 139, 157, 209),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                  backgroundColor: const Color(0xFFE6EDFA), // Light blue
                  padding: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  visualDensity: VisualDensity.compact,
                ),
              )
              .toList() ??
          [],
    );
  }
}
