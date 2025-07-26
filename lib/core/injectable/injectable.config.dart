// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/bookmarks/data/datasources/bookmarks_local_data_source.dart'
    as _i55;
import '../../features/bookmarks/data/repositories/bookmarks_repository_impl.dart'
    as _i1013;
import '../../features/bookmarks/domain/repositories/bookmarks_repository.dart'
    as _i1047;
import '../../features/bookmarks/domain/usecases/bookmarks_usecase.dart'
    as _i33;
import '../../features/details/data/datasources/movie_details_local_data_source.dart'
    as _i474;
import '../../features/details/data/datasources/movie_details_remote_data_source.dart'
    as _i712;
import '../../features/details/data/repositories/movie_details_repository_impl.dart'
    as _i921;
import '../../features/details/domain/repositories/movie_details_repository.dart'
    as _i471;
import '../../features/details/domain/usecases/movie_details_usecase.dart'
    as _i1022;
import '../../features/home/data/datasources/movies_local_data_source.dart'
    as _i169;
import '../../features/home/data/datasources/movies_remote_data_source.dart'
    as _i457;
import '../../features/home/data/repositories/movies_repository_impl.dart'
    as _i738;
import '../../features/home/domain/repositories/movies_repository.dart'
    as _i936;
import '../../features/home/domain/usecases/movies_usecase.dart' as _i460;
import '../../features/search/data/datasources/search_remote_data_source.dart'
    as _i280;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i1017;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i357;
import '../../features/search/domain/usecases/search_movies_usecase.dart'
    as _i451;
import '../network/api_client.dart' as _i557;
import '../network/dio_provider.dart' as _i651;
import '../network/network_module.dart' as _i200;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.factory<_i651.DioProvider>(() => _i651.DioProvider());
    gh.singleton<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i55.BookmarksLocalDataSource>(
        () => _i55.BookmarksLocalDataSourceImpl());
    gh.factory<_i474.MovieDetailsLocalDataSource>(
        () => _i474.MovieDetailsLocalDataSourceImpl());
    gh.singleton<_i557.ApiClient>(
        () => networkModule.apiClient(gh<_i361.Dio>()));
    gh.factory<_i169.MoviesLocalDataSource>(
        () => _i169.MoviesLocalDataSourceImpl());
    gh.factory<_i1047.BookmarksRepository>(() =>
        _i1013.BookmarksRepositoryImpl(gh<_i55.BookmarksLocalDataSource>()));
    gh.factory<_i33.BookmarksUsecase>(
        () => _i33.BookmarksUsecase(gh<_i1047.BookmarksRepository>()));
    gh.factory<_i280.SearchRemoteDataSource>(
        () => _i280.SearchRemoteDataSourceImpl(gh<_i557.ApiClient>()));
    gh.factory<_i712.MovieDetailsRemoteDataSource>(
        () => _i712.MovieDetailsRemoteDataSourceImpl(gh<_i557.ApiClient>()));
    gh.factory<_i457.MoviesRemoteDataSource>(
        () => _i457.MoviesRemoteDataSourceImpl(gh<_i557.ApiClient>()));
    gh.factory<_i357.SearchRepository>(
        () => _i1017.SearchRepositoryImpl(gh<_i280.SearchRemoteDataSource>()));
    gh.factory<_i471.MovieDetailsRepository>(
        () => _i921.MovieDetailsRepositoryImpl(
              remoteDataSource: gh<_i712.MovieDetailsRemoteDataSource>(),
              localDataSource: gh<_i474.MovieDetailsLocalDataSource>(),
            ));
    gh.factory<_i936.MoviesRepository>(() => _i738.MoviesRepositoryImpl(
          remoteDataSource: gh<_i457.MoviesRemoteDataSource>(),
          localDataSource: gh<_i169.MoviesLocalDataSource>(),
        ));
    gh.factory<_i451.SearchMoviesUsecase>(
        () => _i451.SearchMoviesUsecase(gh<_i357.SearchRepository>()));
    gh.factory<_i460.MoviesUsecase>(
        () => _i460.MoviesUsecase(gh<_i936.MoviesRepository>()));
    gh.factory<_i1022.MovieDetailsUseCase>(
        () => _i1022.MovieDetailsUseCase(gh<_i471.MovieDetailsRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i200.NetworkModule {}
