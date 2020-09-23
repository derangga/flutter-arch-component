import 'package:moor_flutter/moor_flutter.dart';

import 'movie_dao.dart';

part 'database_module.g.dart';

class Movies extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movieId => integer()();
  IntColumn get voteCount => integer()();
  TextColumn get title => text()();
  RealColumn get popularity => real()();
  TextColumn get posterPath => text()();
  TextColumn get backdropPath => text()();
  TextColumn get overview => text()();
  TextColumn get releaseDate => text()();
}

@UseMoor(tables: [Movies], daos: [MoviesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
