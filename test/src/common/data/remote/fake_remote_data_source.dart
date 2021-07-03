import 'package:flutter_arch_component/src/common/data/remote/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_arch_component/src/common/data/remote/remote_data_source.dart';
import 'package:flutter_arch_component/src/common/domain/models/remote/movie_response.dart';
import 'package:flutter_arch_component/src/common/domain/models/remote/detail_movie_response.dart';

class FakeRemoteDataSource implements RemoteDataSource {
  bool isRequestSuccess = false;

  @override
  Future<Either<Failure, DetailMovieResponse>> fetchDetailMovies(
      int movieId) async {
    if (isRequestSuccess) {
      return Right(DetailMovieResponse());
    } else {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, MovieResponse>> fetchDiscoverMovies(int page) async {
    if (isRequestSuccess) {
      return Right(MovieResponse());
    } else {
      return Left(Failure());
    }
  }
}
