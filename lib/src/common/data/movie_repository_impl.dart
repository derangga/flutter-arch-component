import 'package:flutter/foundation.dart';

import 'local/db/database_module.dart';
import 'remote/config/network_func.dart';
import '../domain/models/remote/movie_response.dart';
import '../../common/data/local/local_movie_repository.dart';
import '../../common/data/remote/movie_remote_source.dart';
import '../../common/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteSource _remoteSource;
  final MovieLocalSource _localSource;

  MovieRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<void> singleSourceOfTruth(
      {@required int page,
      Function(List<Movie> movieList) onSuccess,
      Function(String message, List<Movie> movieList) onError}) async {
    var movies = await _localSource.getAllMovie();
    onSuccess(movies);

    final result = await _remoteSource.fetchDiscoverMovies(page);

    responseHandler<MovieResponse>(result, onSuccess: (response) {
      _localSource.deleteAllMovie();
      movies = response.moviesList.map((element) {
        Movie movie = Movie(
            movieId: element.id,
            voteCount: element.voteCount,
            title: element.title,
            posterPath: element.posterPath,
            backdropPath: element.backdropPath,
            overview: element.overview,
            releaseDate: element.releaseDate);
        _localSource.insertMovie(movie);
        return movie;
      }).toList();
      onSuccess(movies);
    }, onError: (dioError, code, errorBody) {
      onError("Error : $code ==> $errorBody", movies);
    });
  }
}
