import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:inshorts_movies/core/routes/app_router.dart';
import 'package:inshorts_movies/core/routes/routes_path.dart';

class DeepLinkHandler {
  static final AppLinks _appLinks = AppLinks();

  static Future<void> init() async {
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      _handleDeepLink(initialUri);
    }
    _appLinks.uriLinkStream.listen(_handleDeepLink);
  }

  static void _handleDeepLink(Uri uri) {
    if (uri.scheme == 'imoviex' &&
        uri.host == 'movie' &&
        uri.pathSegments.isNotEmpty) {
      final movieId = uri.pathSegments[0];

      Future.delayed(const Duration(milliseconds: 50), () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          router.push('${RoutesPath.details}?id=$movieId');
        });
      });
    }
  }
}
