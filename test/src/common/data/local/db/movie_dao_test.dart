import 'package:flutter_arch_component/src/common/data/local/db/database_module.dart';
import 'package:flutter_arch_component/src/common/data/local/db/movie_dao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

void main() {
  late AppDatabase appDatabase;
  late MoviesDao dao;

  Movie dummyData = Movie(
      movieId: 1,
      voteCount: 1,
      title: "title",
      posterPath: "posterPath",
      backdropPath: "backdropPath",
      overview: "overview",
      releaseDate: "releaseDate");

  setUp(() {
    appDatabase = AppDatabase(VmDatabase.memory());
    dao = MoviesDao(appDatabase);
  });

  tearDown(() async {
    await appDatabase.close();
  });

  test("test insert movie into database", () async {
    // when
    await dao.insertMovie(dummyData.toCompanion(false));
    final movies = await dao.getAllMovie();

    // then
    expect(movies.length, 1);
  });

  test("test insert movie into database", () async {
    // when
    await dao.insertMovie(dummyData.toCompanion(false));
    final movies = await dao.findMovie(dummyData.movieId);

    // then
    expect(movies.title, dummyData.title);
    expect(movies.overview, dummyData.overview);
    expect(movies.backdropPath, dummyData.backdropPath);
  });

  test("test update movie name", () async {
    // given
    await dao.insertMovie(dummyData.toCompanion(false));
    final movies = await dao.findMovie(dummyData.movieId);
    var newData = movies.copyWith(title: "Naruto");

    expect(movies.title, dummyData.title);
    expect(movies.title, isNot(newData.title));

    // when
    await dao.updateMovie(newData.toCompanion(false));

    // then
    final result = await dao.findMovie(dummyData.movieId);
    expect(result.title, newData.title);
  });

  test("test delete 1 row movie", () async {
    var secondMovie = dummyData.copyWith(movieId: 2, title: "Naruto");
    await dao.insertMovie(dummyData.toCompanion(false));
    await dao.insertMovie(secondMovie.toCompanion(false));

    final moviesDataBeforeDelete = await dao.getAllMovie();
    expect(moviesDataBeforeDelete.length, 2);

    // when
    await dao.deleteMovie(dummyData.toCompanion(false));

    final moviesDataAfterDelete = await dao.getAllMovie();

    expect(moviesDataAfterDelete.length, 1);
  });

  test("test delete all row movie", () async {
    var secondMovie = dummyData.copyWith(movieId: 2, title: "Naruto");
    await dao.insertMovie(dummyData.toCompanion(false));
    await dao.insertMovie(secondMovie.toCompanion(false));

    final moviesDataBeforeDelete = await dao.getAllMovie();
    expect(moviesDataBeforeDelete.length, 2);

    // when
    await dao.deleteAllMovie();

    final moviesDataAfterDelete = await dao.getAllMovie();

    expect(moviesDataAfterDelete.length, 0);
  });
}
