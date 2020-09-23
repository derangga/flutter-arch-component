import 'package:dio/dio.dart';
import 'package:flutter_arch_component/src/common/data/local/db/movie_dao.dart';
import 'package:flutter_arch_component/src/common/data/local/local_movie_repository.dart';
import 'package:flutter_arch_component/src/common/data/movie_repository.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../common/data/remote/config/dio_module.dart';
import '../common/data/remote/movie_remote_source.dart';
import '../common/data/local/db/database_module.dart';

List<SingleChildWidget> serviceLocator = [
  ...independentServices,
  ...dependentServices
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: AppDatabase()),
  Provider.value(value: DioModule.getInstance())
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Dio, MovieRemoteSource>(
    update: (context, dio, remoteRepos) => MovieRemoteSource(dio),
  ),
  ProxyProvider<AppDatabase, MoviesDao>(
    update: (context, db, dao) => MoviesDao(db),
  ),
  ProxyProvider<MoviesDao, MovieLocalSource>(
    update: (context, dao, localRepos) => MovieLocalSource(dao),
  ),
  ProxyProvider2<MovieRemoteSource, MovieLocalSource, MovieRepository>(
    update: (context, remote, local, repos) => MovieRepository(remote, local),
  )
];
