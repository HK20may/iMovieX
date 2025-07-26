import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inshorts_movies/core/routes/routes_name.dart';
import 'package:inshorts_movies/core/routes/routes_path.dart';
import 'package:inshorts_movies/features/bookmarks/presentation/ui/screens/bookmarks_screen.dart';
import 'package:inshorts_movies/features/details/presentation/ui/screens/movie_details_screen.dart';
import 'package:inshorts_movies/features/home/presentation/ui/screens/home.dart';
import 'package:inshorts_movies/features/onboarding/onboarding_screen.dart';
import 'package:inshorts_movies/features/others/bottom_nav_bar.dart';
import 'package:inshorts_movies/features/search/presentation/ui/screens/search_screen.dart';
import 'package:inshorts_movies/features/splash/splash_screen.dart';

enum Tabs { home, bookmarks, search }

final GoRouter _router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    // Handle deep links on app startup
    if (state.uri.host == 'movie' && state.uri.scheme == 'imoviex') {
      final movieId =
          state.uri.pathSegments.isNotEmpty ? state.uri.pathSegments[0] : '';
      return '${RoutesPath.details}?id=$movieId';
    }
    return null; // No redirect needed
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: RoutesPath.onboarding,
      name: RoutesName.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return BottomNavBar(location: state.uri.toString(), child: child);
      },
      routes: [
        GoRoute(
          path: RoutesPath.home,
          name: RoutesName.home,
          pageBuilder:
              (context, state) => const NoTransitionPage(
                child: Home(),
              ), // No animation switching tabs
        ),
        GoRoute(
          path: RoutesPath.bookmarks,
          name: RoutesName.bookmarks,
          pageBuilder:
              (context, state) =>
                  const NoTransitionPage(child: BookmarksScreen()),
        ),
        GoRoute(
          path: RoutesPath.search,
          name: RoutesName.search,
          pageBuilder:
              (context, state) => const NoTransitionPage(child: SearchScreen()),
        ),
      ],
    ),
    GoRoute(
      path: RoutesPath.details,
      name: RoutesName.details,
      builder: (context, state) {
        final movieId =
            state.uri.queryParameters['id'] ?? state.extra.toString();
        return MovieDetailsScreen(movieId: int.parse(movieId));
      },
    ),
  ],
);

GoRouter get router => _router;
