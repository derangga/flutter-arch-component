import 'package:dartz/dartz.dart';
import 'package:dio/src/dio.dart';
import 'package:flutter_arch_component/src/common/data/remote/base_remote.dart';
import 'package:flutter_arch_component/src/common/data/remote/remote_data_source.dart';
import 'package:flutter_arch_component/src/common/domain/models/remote/detail_movie_response.dart';
import 'package:flutter_arch_component/src/common/domain/models/remote/movie_response.dart';

import 'config/api_url.dart';
import 'failure.dart';

class RemoteDataSourceImpl extends BaseRemote implements RemoteDataSource {
  RemoteDataSourceImpl(Dio dio) : super(dio);

  @override
  Future<Either<Failure, MovieResponse>> fetchDiscoverMovies(int page) async {
    String url = ApiUrl.DISCOVER_MOVIES;
    final result = await get(url,
        queryParams: {
          "api_key": ApiUrl.TOKEN,
          "sort_by": "popularity.desc",
          "page": page
        },
        converter: (response) => MovieResponse.fromJson(response));
    return result;
  }

  @override
  Future<Either<Failure, DetailMovieResponse>> fetchDetailMovies(
      int? movieId) async {
    String url = "${ApiUrl.DETAIL_MOVIES}$movieId?api_key=${ApiUrl.TOKEN}";
    final result = await get(url,
        converter: (response) => DetailMovieResponse.fromJson(response));
    return result;
  }
}