// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injection extends Injection {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<Interceptor>((c) => LoggingInterceptor(),
        name: 'Interceptor');
    container.registerSingleton((c) => DefaultHttpClientAdapter(),
        name: 'DefaultHttpClientAdapter');
    container.registerSingleton<Dio>(
        (c) => DioModule(c<Interceptor>('Interceptor'),
            c<DefaultHttpClientAdapter>('DefaultHttpClientAdapter')),
        name: 'Dio');
    container.registerSingleton((c) => AppDatabase(), name: 'AppDatabase');
    container.registerSingleton((c) => MoviesDao(c<AppDatabase>('AppDatabase')),
        name: 'MoviesDao');
    container.registerSingleton<RemoteDataSource>(
        (c) => RemoteDataSourceImpl(c<Dio>('Dio')),
        name: 'RemoteDataSource');
    container.registerSingleton<LocalDataSource>(
        (c) => LocalDataSourceImpl(c<MoviesDao>('MoviesDao')),
        name: 'LocalDataSource');
    container.registerSingleton<MovieRepository>(
        (c) => MovieRepositoryImpl(c<RemoteDataSource>('RemoteDataSource'),
            c<LocalDataSource>('LocalDataSource')),
        name: 'MovieRepository');
    container.registerFactory(
        (c) => HomeBloc(c<MovieRepository>('MovieRepository')));
    container.registerFactory(
        (c) => DetailMovieBloc(c<RemoteDataSource>('RemoteDataSource')));
  }
}
