import 'db/database_module.dart';

abstract class LocalDataSource {

  Future<void> insertMovie(MoviesCompanion movie);

  Future<void> deleteAllMovie();

  Future<List<Movie>> getAllMovie();
}
