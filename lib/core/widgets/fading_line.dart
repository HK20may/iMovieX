import 'package:flutter/material.dart';
import 'package:inshorts_movies/core/constants/app_colors.dart';

class FadingLine extends StatelessWidget {
  const FadingLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black38,
              AppColors.secondaryBlackColor,
              Colors.transparent,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    );
  }
}
