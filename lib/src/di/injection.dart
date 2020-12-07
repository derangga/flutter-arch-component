import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';


import '../common/data/local/db/database_module.dart';
import '../common/data/local/db/movie_dao.dart';
import '../common/data/local/local_movie_repository.dart';
import '../common/data/movie_repository_impl.dart';
import '../common/data/remote/config/dio_module.dart';
import '../common/data/remote/movie_remote_source.dart';
import '../common/domain/repository/movie_repository.dart';
import '../ui/home/bloc/home_bloc.dart';
import '../ui/detail/bloc/detail_movie_bloc.dart';

part 'injection.g.dart';

abstract class Injection {
  
  @Register.singleton(Dio, from: DioModule)
  @Register.singleton(AppDatabase)
  @Register.singleton(MoviesDao, resolvers: {AppDatabase: null})
  @Register.singleton(MovieRemoteSource, resolvers: {Dio: null})
  @Register.singleton(MovieLocalSource, resolvers: {MoviesDao: null})
  @Register.singleton(MovieRepository, from: MovieRepositoryImpl, resolvers: {MovieRemoteSource: null, MovieLocalSource: null})
  @Register.factory(HomeBloc, resolvers: {MovieRepository: null})
  @Register.factory(DetailMovieBloc, resolvers: {MovieRemoteSource: null})
  void configure();
}

class AppModule {
  static void setup() {
    var injection = _$Injection();
    injection.configure();
  }
}