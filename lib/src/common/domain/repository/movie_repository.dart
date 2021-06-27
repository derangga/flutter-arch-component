import '../../data/local/db/database_module.dart';

abstract class MovieRepository {
  Stream<S> singleSourceOfTruth<S>(
      int page,
      Stream<S> Function(List<Movie> movieList) onSuccess,
      Stream<S> Function(String message, List<Movie> movieList) onError);
}
