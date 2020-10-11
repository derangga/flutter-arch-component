import 'package:flutter/foundation.dart';
import '../../data/local/db/database_module.dart';

abstract class MovieRepository {
  Future<void> singleSourceOfTruth(
      {@required int page,
      Function(List<Movie> movieList) onSuccess,
      Function(String message, List<Movie> movieList) onError});
}
