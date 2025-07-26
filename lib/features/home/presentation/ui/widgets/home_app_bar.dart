import 'package:flutter/material.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppAssets.appIcon, height: 120),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.notifications_outlined, size: 28),
        ),
      ],
    );
  }
}
