import 'local/db/database_module.dart';
import '../../common/data/local/local_data_source.dart';
import '../../common/data/remote/remote_data_source.dart';
import '../../common/domain/repository/movie_repository.dart';
import '../../utils/extension.dart';

class MovieRepositoryImpl implements MovieRepository {
  late final RemoteDataSource _remoteSource;
  late final LocalDataSource _localSource;

  MovieRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Stream<S> singleSourceOfTruth<S>(
      int page,
      Stream<S> Function(List<Movie> movieList) onSuccess,
      Stream<S> Function(String message, List<Movie> movieList) onError) async* {
    var movies = await _localSource.getAllMovie();
    yield* onSuccess.call(movies);

    final result = await _remoteSource.fetchDiscoverMovies(page);

    yield* result.fold((failure) async* {
      yield* onError.call("Error : ${failure.code} ==> ${failure.errorBody}", movies);
    }, (success) async* {
      await _localSource.deleteAllMovie();
      movies = success.moviesList!.map((element) {
        Movie movie = Movie(
            movieId: element.id.orZero(),
            voteCount: element.voteCount.orZero(),
            title: element.title.orEmpty(),
            posterPath: element.posterPath.orEmpty(),
            backdropPath: element.backdropPath.orEmpty(),
            overview: element.overview.orEmpty(),
            releaseDate: element.releaseDate.orEmpty());
        _localSource.insertMovie(movie.toCompanion(false));
        return movie;
      }).toList();
      yield* onSuccess.call(movies);
    });
  }
}
