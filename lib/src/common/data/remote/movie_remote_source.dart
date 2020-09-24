import 'package:dio/dio.dart';
import 'base_remote.dart';
import 'config/api_url.dart';
import 'config/result.dart';

import '../../domain/models/remote/movie_response.dart';
import '../../domain/models/remote/detail_movie_response.dart';

class MovieRemoteSource extends BaseRemote {
  MovieRemoteSource(Dio dio) : super(dio);

  Future<Result<MovieResponse>> fetchDiscoverMovies(int page) async {
    String url =
        "${ApiUrl.DISCOVER_MOVIES}?api_key=${ApiUrl.TOKEN}&sort_by=popularity.desc&page=$page";
    final result = await getMethod(url,
        converter: (response) => MovieResponse.fromJson(response));
    return result;
  }

  Future<Result<DetailMovieResponse>> fetchDetailMovies(int movieId) async {
    String url = "${ApiUrl.DETAIL_MOVIES}$movieId?api_key=${ApiUrl.TOKEN}";
    final result = await getMethod(url,
        converter: (response) => DetailMovieResponse.fromJson(response));
    return result;
  }
}
