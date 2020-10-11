import 'package:moor_flutter/moor_flutter.dart';

class Movies extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get movieId => integer()();
  IntColumn get voteCount => integer()();
  TextColumn get title => text()();
  TextColumn get posterPath => text()();
  TextColumn get backdropPath => text()();
  TextColumn get overview => text()();
  TextColumn get releaseDate => text()();
}
