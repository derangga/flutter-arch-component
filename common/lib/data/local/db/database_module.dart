import 'package:moor_flutter/moor_flutter.dart';
import 'movie_dao.dart';
import '../../../domain/models/local/movie_table.dart';

part 'database_module.g.dart';

@UseMoor(tables: [Movies], daos: [MoviesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
