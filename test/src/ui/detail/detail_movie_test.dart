import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_arch_component/src/common/data/local/local_data_source.dart';
import 'package:flutter_arch_component/src/common/data/movie_repository_impl.dart';
import 'package:flutter_arch_component/src/common/data/remote/failure.dart';
import 'package:flutter_arch_component/src/common/data/remote/remote_data_source.dart';
import 'package:flutter_arch_component/src/common/domain/models/remote/detail_movie_response.dart';
import 'package:flutter_arch_component/src/common/domain/repository/movie_repository.dart';
import 'package:flutter_arch_component/src/ui/detail/bloc/detail_movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mock_class.dart';

void main() {
  late LocalDataSource mockLocalDataSource;
  late RemoteDataSource mockRemoteDataSource;
  late MovieRepository repository;

  late DetailMovieBloc detailMovieBloc;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    repository = MovieRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
    detailMovieBloc = DetailMovieBloc(repository);
  });

  blocTest<DetailMovieBloc, DetailMovieState>(
      "test get detail movie and request movie failed",
      build: () {
        when(() => mockRemoteDataSource.fetchDetailMovies(any()))
            .thenAnswer((invocation) async => Left(Failure()));
        return detailMovieBloc;
      },
      act: (bloc) => bloc.add(GetDetailMovieEvent(1)),
      expect: () =>
          [isA<LoadingViewState>(), isA<FailedGetDetailMovieState>()]);

  blocTest<DetailMovieBloc, DetailMovieState>(
      "test get detail movie and request movie success",
      build: () {
        DetailMovieResponse detailMovieResponse = DetailMovieResponse();
        when(() => mockRemoteDataSource.fetchDetailMovies(any()))
            .thenAnswer((invocation) async => Right(detailMovieResponse));
        return detailMovieBloc;
      },
      act: (bloc) => bloc.add(GetDetailMovieEvent(1)),
      expect: () =>
          [isA<LoadingViewState>(), isA<SuccessGetDetailMovieState>()]);
}
