import 'package:flutter_arch_component/src/common/data/local/db/database_module.dart';
import 'package:flutter_arch_component/src/common/data/local/local_data_source.dart';

class FakeLocalDataSource implements LocalDataSource {
  bool shouldReturnEmptyData = false;

  @override
  Future<int> deleteAllMovie() async {
    return 1;
  }

  @override
  Future<List<Movie>> getAllMovie() async {
    if (!shouldReturnEmptyData) {
      return [
        Movie(
            movieId: 1,
            voteCount: 1,
            title: "title",
            posterPath: "posterPath",
            backdropPath: "backdropPath",
            overview: "overview",
            releaseDate: "releaseDate")
      ];
    } else {
      return [];
    }
  }

  @override
  Future<int> insertMovie(MoviesCompanion movie) async {
    return 1;
  }
}
