import 'package:moor_flutter/moor_flutter.dart';

class DatabaseExecutor extends FlutterQueryExecutor {
  DatabaseExecutor() : super(path: 'db.sqlite', logStatements: true);
}
