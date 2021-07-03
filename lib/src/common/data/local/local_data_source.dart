import 'db/database_module.dart';

abstract class LocalDataSource {
  Future<int> insertMovie(MoviesCompanion movie);

  Future<int> deleteAllMovie();

  Future<List<Movie>> getAllMovie();
}
