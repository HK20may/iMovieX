import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/core/network/api_client.dart';
import 'package:inshorts_movies/core/network/dio_provider.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio get dio => DioProvider().dio;

  @singleton
  ApiClient apiClient(Dio dio) => ApiClient(dio);
}
