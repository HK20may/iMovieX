import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/core/injectable/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDI() => getIt.init();
