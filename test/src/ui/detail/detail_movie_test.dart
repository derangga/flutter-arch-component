import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_arch_component/src/common/data/movie_repository_impl.dart';
import 'package:flutter_arch_component/src/common/domain/repository/movie_repository.dart';
import 'package:flutter_arch_component/src/ui/detail/bloc/detail_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/data/local/fake_local_data_source.dart';
import '../../common/data/remote/fake_remote_data_source.dart';

void main() {
  late FakeLocalDataSource fakeLocalDataSource;
  late FakeRemoteDataSource fakeRemoteDataSource;
  late MovieRepository repository;

  late DetailMovieBloc detailMovieBloc;

  setUp(() {
    fakeLocalDataSource = FakeLocalDataSource();
    fakeRemoteDataSource = FakeRemoteDataSource();
    repository = MovieRepositoryImpl(fakeRemoteDataSource, fakeLocalDataSource);
    detailMovieBloc = DetailMovieBloc(repository);
  });

  blocTest<DetailMovieBloc, DetailMovieState>(
      "test get detail movie and request movie failed",
      build: () {
        return detailMovieBloc;
      },
      act: (bloc) => bloc.add(GetDetailMovieEvent(1)),
      expect: () =>
          [isA<LoadingViewState>(), isA<FailedGetDetailMovieState>()]);

  blocTest<DetailMovieBloc, DetailMovieState>(
      "test get detail movie and request movie success",
      build: () {
        fakeRemoteDataSource.isRequestSuccess = true;
        return detailMovieBloc;
      },
      act: (bloc) => bloc.add(GetDetailMovieEvent(1)),
      expect: () =>
          [isA<LoadingViewState>(), isA<SuccessGetDetailMovieState>()]);
}
