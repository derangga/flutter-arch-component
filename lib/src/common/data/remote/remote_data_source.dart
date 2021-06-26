import 'package:dartz/dartz.dart';
import 'package:flutter_arch_component/src/common/data/remote/failure.dart';

import '../../domain/models/remote/movie_response.dart';
import '../../domain/models/remote/detail_movie_response.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, MovieResponse>> fetchDiscoverMovies(int page) ;

  Future<Either<Failure, DetailMovieResponse>> fetchDetailMovies(int movieId);
}
