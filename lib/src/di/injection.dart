import 'package:dio/dio.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../common/data/remote/config/dio_module.dart';
import '../common/data/remote/movie_remote_source.dart';
import '../common/data/local/db/database_module.dart';
import '../common/domain/repository/movie_repository.dart';
import '../common/data/local/local_movie_repository.dart';
import '../common/data/movie_repository_impl.dart';
import '../common/data/local/db/movie_dao.dart';

List<SingleChildWidget> appServices = [
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
    update: (context, remote, local, repos) =>
        MovieRepositoryImpl(remote, local),
  )
];
