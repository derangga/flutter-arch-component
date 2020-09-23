import 'package:flutter/foundation.dart';
import 'package:flutter_arch_component/src/common/data/local/local_movie_repository.dart';
import 'package:flutter_arch_component/src/common/data/remote/movie_remote_source.dart';
import 'package:flutter_arch_component/src/common/domain/movie_response.dart';

import 'local/db/database_module.dart';
import 'remote/config/network_func.dart';

class MovieRepository {
  final MovieRemoteSource _remoteSource;
  final MovieLocalSource _localSource;

  MovieRepository(this._remoteSource, this._localSource);

  Future<void> singleSourceOfTruth({@required int page, Function(List<Movie> movieList) onSuccess,
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
            popularity: element.popularity,
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
