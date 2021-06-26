import 'package:moor_flutter/moor_flutter.dart';
import 'database_module.dart';
import '../../../domain/models/local/movie_table.dart';

part 'movie_dao.g.dart';

@UseDao(tables: [Movies])
class MoviesDao extends DatabaseAccessor<AppDatabase> with _$MoviesDaoMixin {
  MoviesDao(AppDatabase db) : super(db);

  Future insertMovie(MoviesCompanion movie) =>
      into(movies).insert(movie, mode: InsertMode.insertOrReplace);
  Future updateMovie(MoviesCompanion movie) => update(movies).replace(movie);
  Future deleteMovie(MoviesCompanion movie) => delete(movies).delete(movie);

  Future deleteAllMovie() => delete(movies).go();
  Future<List<Movie>> getAllMovie() => select(movies).get();
}
