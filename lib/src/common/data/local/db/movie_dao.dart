import 'package:moor_flutter/moor_flutter.dart';

import 'database_module.dart';

part 'movie_dao.g.dart';

@UseDao(tables: [Movies])
class MoviesDao extends DatabaseAccessor<AppDatabase> with _$MoviesDaoMixin {
  MoviesDao(AppDatabase db) : super(db);

  Future insertMovie(Movie movie) =>
      into(movies).insert(movie, mode: InsertMode.insertOrReplace);
  Future updateMovie(Movie movie) => update(movies).replace(movie);
  Future deleteMovie(Movie movie) => delete(movies).delete(movie);

  Future deleteAllMovie() => delete(movies).go();
  Future<List<Movie>> getAllMovie() => select(movies).get();
}
