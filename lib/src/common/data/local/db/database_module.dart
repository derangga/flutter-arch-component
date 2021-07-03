import 'package:moor_flutter/moor_flutter.dart';
import 'movie_dao.dart';
import '../../../domain/models/local/movie_table.dart';

part 'database_module.g.dart';

@UseMoor(tables: [Movies], daos: [MoviesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
