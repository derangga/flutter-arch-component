import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_arch_component/src/common/data/local/db/database_module.dart';
import 'package:flutter_arch_component/src/common/data/movie_repository_impl.dart';
import 'package:flutter_arch_component/src/common/domain/repository/movie_repository.dart';
import 'package:flutter_arch_component/src/ui/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common/data/local/fake_local_data_source.dart';
import '../../common/data/remote/fake_remote_data_source.dart';

void main() {
  late FakeLocalDataSource fakeLocalDataSource;
  late FakeRemoteDataSource fakeRemoteDataSource;
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

  setUp(() {
    fakeLocalDataSource = FakeLocalDataSource();
    fakeRemoteDataSource = FakeRemoteDataSource();
    repository = MovieRepositoryImpl(fakeRemoteDataSource, fakeLocalDataSource);
    homeBloc = HomeBloc(repository);

    registerFallbackValue(dummyData.toCompanion(false));
  });

  blocTest<HomeBloc, HomeState>(
      "test fetch movie first time with empty local source and success request then remote data should be save into database and emit SuccessGetDiscoverState",
      build: () {
        fakeLocalDataSource.shouldReturnEmptyData = true;
        fakeRemoteDataSource.isRequestSuccess = true;

        return homeBloc;
      },
      act: (bloc) => bloc.add(GetDiscoverMovieEvent()),
      expect: () => [isA<LoadingState>(), isA<SuccessGetDiscoverState>()]);

  blocTest<HomeBloc, HomeState>(
      "test fetch movie first time and failed request with empty local data source should emit FailedGetDiscoverState",
      build: () {
        fakeLocalDataSource.shouldReturnEmptyData = true;
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
        fakeRemoteDataSource.isRequestSuccess = true;

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
        fakeLocalDataSource.shouldReturnEmptyData = false;

        return homeBloc;
      },
      act: (bloc) => bloc.add(GetDiscoverMovieEvent()),
      expect: () => [
            isA<LoadingState>(),
            isA<SuccessGetDiscoverState>(),
            isA<FailedGetDiscoverState>()
          ]);
}
