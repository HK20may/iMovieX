import 'package:flutter/material.dart';
import 'package:inshorts_movies/core/constants/app_assets.dart';
import 'package:inshorts_movies/core/routes/app_router.dart';
import 'package:inshorts_movies/core/routes/routes_path.dart';
import 'package:inshorts_movies/features/onboarding/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingContent> _pages = [
    const OnboardingContent(
      imagePath: AppAssets.onboarding1,
      title: 'Discover Popular & Trending',
      subtitle:
          'Stay updated with the latest movies, top picks, and now-playing gems from TMDB.',
    ),
    const OnboardingContent(
      imagePath: AppAssets.onboarding2,
      title: 'Save What You Love',
      subtitle:
          'Bookmark movies to watch later. Your favorites, always just a tap away.',
    ),
    const OnboardingContent(
      imagePath: AppAssets.onboarding3,
      title: 'Watch Trailers Instantly',
      subtitle:
          'Dive deeper into every film with official trailers right inside the app.',
    ),
  ];

  void _nextPage() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _goToHome();
    }
  }

  void _goToHome() {
    router.go(RoutesPath.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            itemBuilder: (_, index) => _pages[index],
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: _goToHome,
              child: const Text("Skip", style: TextStyle(color: Colors.white)),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: ElevatedButton(
                key: ValueKey(_currentIndex),
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 80,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  _currentIndex == _pages.length - 1 ? "Get Started" : "Next",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
