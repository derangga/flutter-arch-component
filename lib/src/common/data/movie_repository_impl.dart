import 'package:flutter_arch_component/src/common/domain/models/remote/detail_movie_response.dart';

import 'package:flutter_arch_component/src/common/data/remote/failure.dart';

import 'package:dartz/dartz.dart';

import 'local/db/database_module.dart';
import '../../common/data/local/local_data_source.dart';
import '../../common/data/remote/remote_data_source.dart';
import '../../common/domain/repository/movie_repository.dart';
import '../../utils/extension.dart';

class MovieRepositoryImpl implements MovieRepository {
  late final RemoteDataSource _remoteSource;
  late final LocalDataSource _localSource;

  MovieRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Stream<S> singleSourceOfTruth<S>(
      int page,
      Stream<S> Function(List<Movie> movieList) onSuccess,
      Stream<S> Function(String message, List<Movie> movieList)
          onError) async* {
    var movies = await _localSource.getAllMovie();

    if (movies.isNotEmpty) {
      yield* onSuccess.call(movies);
    }

    final result = await _remoteSource.fetchDiscoverMovies(page);

    yield* result.fold((failure) async* {
      yield* onError.call(
          "Error : ${failure.code} ==> ${failure.errorBody}", movies);
    }, (success) async* {
      await _localSource.deleteAllMovie();
      movies = success.moviesList.orEmpty().map((element) {
        Movie movie = Movie(
            movieId: element.id.orZero(),
            voteCount: element.voteCount.orZero(),
            title: element.title.orEmpty(),
            posterPath: element.posterPath.orEmpty(),
            backdropPath: element.backdropPath.orEmpty(),
            overview: element.overview.orEmpty(),
            releaseDate: element.releaseDate.orEmpty());
        _localSource.insertMovie(movie.toCompanion(false));
        return movie;
      }).toList();
      yield* onSuccess.call(movies);
    });
  }

  @override
  Future<Either<Failure, DetailMovie>> fetchDetailMovies(int movieId) async {
    var response = await _remoteSource.fetchDetailMovies(movieId);
    return response.fold((failure) => Left(failure), (success) {
      DetailMovie detailMovie = DetailMovie(
          success.backdropPath.orEmpty(),
          success.title.orEmpty(),
          success.overview.orEmpty(),
          success.posterPath.orEmpty(),
          success.releaseDate.orEmpty(),
          success.status.orEmpty(),
          success.voteAverage.orZero(),
          success.voteCount.orZero());
      return Right(detailMovie);
    });
  }
}
