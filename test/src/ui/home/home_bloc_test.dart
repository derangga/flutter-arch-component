import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_arch_component/src/common/data/local/db/database_module.dart';
import 'package:flutter_arch_component/src/common/data/local/local_data_source.dart';
import 'package:flutter_arch_component/src/common/data/movie_repository_impl.dart';
import 'package:flutter_arch_component/src/common/data/remote/failure.dart';
import 'package:flutter_arch_component/src/common/data/remote/remote_data_source.dart';
import 'package:flutter_arch_component/src/common/domain/models/remote/movie_response.dart';
import 'package:flutter_arch_component/src/common/domain/repository/movie_repository.dart';
import 'package:flutter_arch_component/src/ui/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mock_class.dart';

void main() {
  late LocalDataSource mockLocalDataSource;
  late RemoteDataSource mockRemoteDataSource;
  late MovieRepository repository;
  late HomeBloc homeBloc;

  Movie dummyData = Movie(
    movieId: 1,
    voteCount: 1,
    title: "title",
    posterPath: "posterPath",
    backdropPath: "backdropPath",
    overview: "overview",
    releaseDate: "releaseDate",
  );

  MovieResponse dummyResponse = MovieResponse(
    page: 1,
    moviesList: [Movies()],
    totalPages: 1,
    totalResults: 1,
  );

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    repository = MovieRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
    homeBloc = HomeBloc(repository);

    registerFallbackValue(dummyData.toCompanion(false));
  });

  blocTest<HomeBloc, HomeState>(
      "test fetch movie first time with empty local source and success request then remote data should be save into database and emit SuccessGetDiscoverState",
      build: () {
        when(() => mockLocalDataSource.getAllMovie())
            .thenAnswer((invocation) async => []);

        when(() => mockLocalDataSource.deleteAllMovie())
            .thenAnswer((invocation) async => 1);

        when(() => mockLocalDataSource.insertMovie(any()))
            .thenAnswer((invocation) async => 1);

        when(() => mockRemoteDataSource.fetchDiscoverMovies(any()))
            .thenAnswer((invocation) async => Right(dummyResponse));

        return homeBloc;
      },
      act: (bloc) => bloc.add(GetDiscoverMovieEvent()),
      expect: () => [isA<LoadingState>(), isA<SuccessGetDiscoverState>()]);

  blocTest<HomeBloc, HomeState>(
      "test fetch movie first time and failed request with empty local data source should emit FailedGetDiscoverState",
      build: () {
        when(() => mockLocalDataSource.getAllMovie())
            .thenAnswer((invocation) async => []);

        when(() => mockRemoteDataSource.fetchDiscoverMovies(any()))
            .thenAnswer((invocation) async => Left(Failure()));

        return homeBloc;
      },
      act: (bloc) => bloc.add(GetDiscoverMovieEvent()),
      expect: () => [
            isA<LoadingState>(),
            isA<FailedGetDiscoverState>(),
          ]);

  blocTest<HomeBloc, HomeState>(
      "test fetch movie with 1 data row in local data source and request success request then remote data should be save into database and emit SuccessGetDiscoverState 2x",
      build: () {
        when(() => mockLocalDataSource.getAllMovie())
            .thenAnswer((invocation) async => [dummyData]);

        when(() => mockLocalDataSource.deleteAllMovie())
            .thenAnswer((invocation) async => 1);

        when(() => mockLocalDataSource.insertMovie(any()))
            .thenAnswer((invocation) async => 1);

        when(() => mockRemoteDataSource.fetchDiscoverMovies(any()))
            .thenAnswer((invocation) async => Right(dummyResponse));

        return homeBloc;
      },
      act: (bloc) => bloc.add(GetDiscoverMovieEvent()),
      expect: () => [
            isA<LoadingState>(),
            isA<SuccessGetDiscoverState>(),
            isA<SuccessGetDiscoverState>()
          ]);

  blocTest<HomeBloc, HomeState>(
      "test fetch movie and failed request with 1 row local data source should emit SuccessGetDiscoverState, FailedGetDiscoverState",
      build: () {
        when(() => mockLocalDataSource.getAllMovie())
            .thenAnswer((invocation) async => [dummyData]);

        when(() => mockRemoteDataSource.fetchDiscoverMovies(any()))
            .thenAnswer((invocation) async => Left(Failure()));

        return homeBloc;
      },
      act: (bloc) => bloc.add(GetDiscoverMovieEvent()),
      expect: () => [
            isA<LoadingState>(),
            isA<SuccessGetDiscoverState>(),
            isA<FailedGetDiscoverState>()
          ]);
}
