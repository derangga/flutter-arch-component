import 'package:moor_flutter/moor_flutter.dart';
import 'database_module.dart';
import '../../../domain/models/local/movie_table.dart';

part 'movie_dao.g.dart';

@UseDao(tables: [Movies])
class MoviesDao extends DatabaseAccessor<AppDatabase> with _$MoviesDaoMixin {
  MoviesDao(AppDatabase db) : super(db);

  Future<int> insertMovie(MoviesCompanion movie) =>
      into(movies).insert(movie, mode: InsertMode.insertOrReplace);
  Future<bool> updateMovie(MoviesCompanion movie) =>
      update(movies).replace(movie);
  Future<int> deleteMovie(MoviesCompanion movie) =>
      delete(movies).delete(movie);

  Future<int> deleteAllMovie() => delete(movies).go();
  Future<Movie> findMovie(int id) =>
      (select(movies)..where((tbl) => tbl.movieId.equals(id))).getSingle();
  Future<List<Movie>> getAllMovie() => select(movies).get();
}
