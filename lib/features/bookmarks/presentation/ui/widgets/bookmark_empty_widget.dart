import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';
import 'package:lottie/lottie.dart';

class BookmarkEmptyWidget extends StatefulWidget {
  const BookmarkEmptyWidget({super.key});

  @override
  State<BookmarkEmptyWidget> createState() => _BookmarkEmptyWidgetState();
}

class _BookmarkEmptyWidgetState extends State<BookmarkEmptyWidget>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            loadLottie(),
            Text(
              "No Favorites",
              style: TextStyle(
                fontSize: 32,
                color: Colors.grey.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(4),
            Text(
              "You haven’t liked any movies yet.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadLottie() {
    return Lottie.asset(
      AppAssets.emptyLottie,
      controller: _animationController,
      width: MediaQuery.of(context).size.width * 0.5,
      fit: BoxFit.fill,
      // animate: true,
      repeat: false,
      onLoaded: ((composition) {
        _animationController
          ..duration = composition.duration
          ..forward().whenComplete(() {
            // return RouteHelper.pushReplacement(Routes.ONBOARDING_INTRO);
          });
      }),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
