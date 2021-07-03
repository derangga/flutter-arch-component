import 'db/database_module.dart';
import 'db/movie_dao.dart';
import 'local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  late final MoviesDao _moviesDao;

  LocalDataSourceImpl(this._moviesDao);

  @override
  Future<int> insertMovie(MoviesCompanion movie) async {
    return await _moviesDao.insertMovie(movie);
  }

  @override
  Future<int> deleteAllMovie() async {
    return await _moviesDao.deleteAllMovie();
  }

  @override
  Future<List<Movie>> getAllMovie() async {
    return await _moviesDao.getAllMovie();
  }
}
