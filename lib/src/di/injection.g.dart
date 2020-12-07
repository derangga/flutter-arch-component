// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injection extends Injection {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<Dio>((c) => DioModule());
    container.registerSingleton((c) => AppDatabase());
    container.registerSingleton((c) => MoviesDao(c<AppDatabase>()));
    container.registerSingleton((c) => MovieRemoteSource(c<Dio>()));
    container.registerSingleton((c) => MovieLocalSource(c<MoviesDao>()));
    container.registerSingleton<MovieRepository>((c) =>
        MovieRepositoryImpl(c<MovieRemoteSource>(), c<MovieLocalSource>()));
    container.registerFactory((c) => HomeBloc(c<MovieRepository>()));
    container.registerFactory((c) => DetailMovieBloc(c<MovieRemoteSource>()));
  }
}
