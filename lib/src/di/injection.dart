import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_arch_component/src/common/data/local/local_data_source_impl.dart';
import 'package:flutter_arch_component/src/common/data/remote/config/logging_interceptor.dart';
import 'package:flutter_arch_component/src/common/data/remote/remote_data_source_impl.dart';
import 'package:kiwi/kiwi.dart';

import '../common/data/local/db/database_module.dart';
import '../common/data/local/db/movie_dao.dart';
import '../common/data/local/local_data_source.dart';
import '../common/data/movie_repository_impl.dart';
import '../common/data/remote/config/dio_module.dart';
import '../common/data/remote/remote_data_source.dart';
import '../common/domain/repository/movie_repository.dart';
import '../ui/home/bloc/home_bloc.dart';
import '../ui/detail/bloc/detail_movie_bloc.dart';

part 'injection.g.dart';

abstract class Injection {
  @Register.singleton(DioOptions, name: "DioOptions")
  @Register.singleton(Interceptor,
      from: LoggingInterceptor, name: "Interceptor")
  @Register.singleton(DefaultHttpClientAdapter,
      name: "DefaultHttpClientAdapter")
  @Register.singleton(Dio,
      from: DioModule,
      resolvers: {
        DioOptions: "DioOptions",
        Interceptor: "Interceptor",
        DefaultHttpClientAdapter: "DefaultHttpClientAdapter"
      },
      name: "Dio")
  @Register.singleton(AppDatabase, name: "AppDatabase")
  @Register.singleton(MoviesDao,
      resolvers: {AppDatabase: "AppDatabase"}, name: "MoviesDao")
  @Register.singleton(RemoteDataSource, from: RemoteDataSourceImpl,
      resolvers: {Dio: "Dio"}, name: "RemoteDataSource")
  @Register.singleton(LocalDataSource, from: LocalDataSourceImpl,
      resolvers: {MoviesDao: "MoviesDao"}, name: "LocalDataSource")
  @Register.singleton(MovieRepository,
      from: MovieRepositoryImpl,
      resolvers: {
        RemoteDataSource: "RemoteDataSource",
        LocalDataSource: "LocalDataSource"
      },
      name: "MovieRepository")
  @Register.factory(HomeBloc, resolvers: {MovieRepository: "MovieRepository"})
  @Register.factory(DetailMovieBloc,
      resolvers: {RemoteDataSource: "RemoteDataSource"})
  void configure();
}

class AppModule {
  static void setup() {
    var injection = _$Injection();
    injection.configure();
  }
}
