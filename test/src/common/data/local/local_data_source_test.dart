import 'package:flutter_arch_component/src/common/data/local/db/database_module.dart';
import 'package:flutter_arch_component/src/common/data/local/db/movie_dao.dart';
import 'package:flutter_arch_component/src/common/data/local/local_data_source.dart';
import 'package:flutter_arch_component/src/common/data/local/local_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDao extends Mock implements MoviesDao {}

void main() {
  late MoviesDao mockMovieDao;
  late LocalDataSource localDataSource;
  Movie dummyData = Movie(
      movieId: 1,
      voteCount: 1,
      title: "title",
      posterPath: "posterPath",
      backdropPath: "backdropPath",
      overview: "overview",
      releaseDate: "releaseDate");

  setUp(() {
    mockMovieDao = MockDao();
    localDataSource = LocalDataSourceImpl(mockMovieDao);
    registerFallbackValue(dummyData.toCompanion(false));
  });

  test("test insert movie and MoviesDao.insertMovie function should be call",
      () async {
    MoviesCompanion movieCompanion = dummyData.toCompanion(false);
    when(() => mockMovieDao.insertMovie(any())).thenAnswer((_) async => 1);

    await localDataSource.insertMovie(movieCompanion);

    Future(expectAsync0(() {
      verify(() => mockMovieDao.insertMovie(movieCompanion)).called(1);
    }));
  });

  test("test get all movie and MoviesDao.getAllMovie function should be call",
      () async {
    when(() => mockMovieDao.getAllMovie()).thenAnswer((_) async => [dummyData]);

    await localDataSource.getAllMovie();

    Future(expectAsync0(() {
      verify(() => mockMovieDao.getAllMovie()).called(1);
    }));
  });

  test(
      "test deleteAll movie and MoviesDao.deleteAllMovie function should be call",
      () async {
    when(() => mockMovieDao.deleteAllMovie()).thenAnswer((_) async => 1);

    await localDataSource.deleteAllMovie();

    Future(expectAsync0(() {
      verify(() => mockMovieDao.deleteAllMovie()).called(1);
    }));
  });
}
