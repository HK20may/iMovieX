import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:inshorts_movies/core/constants/api_urls.dart';
import 'package:inshorts_movies/core/network/api_logging_interceptor.dart';

@Injectable()
class DioProvider {
  DioProvider._internal() {
    _dio.interceptors.add(APILoggingInterceptor());
  }

  static final DioProvider _instance = DioProvider._internal();

  factory DioProvider() => _instance;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseUrl,
      connectTimeout: const Duration(milliseconds: 25000),
      receiveTimeout: const Duration(milliseconds: 25000),
      sendTimeout: const Duration(milliseconds: 25000),
      receiveDataWhenStatusError: true,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NTc3ZTQ4ZTQwYjg0ZDA2MDViZWRlNmJiYzY3ZWJhOCIsIm5iZiI6MTcxNDY2OTE0Ni43MTYsInN1YiI6IjY2MzNjNjVhNjY1NjVhMDEyODEzZmI2MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.DE3Zff-eFTbdrZQTyf-soyXrvd7m74OgHp3xWXm_k90',
        'accept': 'application/json',
      },
    ),
  );
  Dio get dio => _dio;
}
