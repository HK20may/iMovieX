import 'package:flutter/services.dart';
import 'package:inshorts_movies/core/database/hive_initializer.dart';
import 'package:inshorts_movies/core/injectable/injectable.dart';
import 'package:inshorts_movies/core/services/deep_link_handler.dart';

class AppService {
  factory AppService() {
    return _instance;
  }
  AppService._();

  static final AppService _instance = AppService._();

  Future init() async {
    try {
      configureDI();
      await initHive();
      await DeepLinkHandler.init();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } catch (e) {
      // ErrorReporter.error(e, stackTrace: st, errorMsg: "AppAnalytics: init()");
    }
  }
}
