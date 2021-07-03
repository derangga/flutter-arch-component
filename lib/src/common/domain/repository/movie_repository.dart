import 'package:dartz/dartz.dart';
import 'package:flutter_arch_component/src/common/data/remote/failure.dart';
import 'package:flutter_arch_component/src/common/domain/models/remote/detail_movie_response.dart';

import '../../data/local/db/database_module.dart';

abstract class MovieRepository {
  Stream<S> singleSourceOfTruth<S>(
      int page,
      Stream<S> Function(List<Movie> movieList) onSuccess,
      Stream<S> Function(String message, List<Movie> movieList) onError);

  Future<Either<Failure, DetailMovie>> fetchDetailMovies(int movieId);
}
