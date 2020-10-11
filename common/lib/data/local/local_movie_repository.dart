import 'db/database_module.dart';
import 'db/movie_dao.dart';

class MovieLocalSource {
  final MoviesDao _moviesDao;

  MovieLocalSource(this._moviesDao);

  Future insertMovie(Movie movie) async {
    await _moviesDao.insertMovie(movie);
  }

  Future deleteMovie(Movie movie) async {
    await _moviesDao.deleteMovie(movie);
  }

  Future deleteAllMovie() async {
    await _moviesDao.deleteAllMovie();
  }

  Future<List<Movie>> getAllMovie() async {
    return await _moviesDao.getAllMovie();
  }
}
