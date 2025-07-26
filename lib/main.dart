import 'package:flutter/material.dart';
import 'package:inshorts_movies/core/services/app_service.dart';
import 'package:inshorts_movies/inshorts_movies_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppService().init();
  runApp(const InshortsMoviesApp());
}
