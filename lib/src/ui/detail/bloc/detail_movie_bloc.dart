import 'package:common/data/remote/config/network_func.dart';
import 'package:common/data/remote/movie_remote_source.dart';
import 'package:common/domain/models/remote/detail_movie_response.dart';
import 'package:core/base/base_bloc.dart';
import 'package:core/base/bloc_event.dart';
import 'package:core/base/bloc_state.dart';
import 'package:flutter/foundation.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {
  final MovieRemoteSource _remoteSource;

  DetailMovieBloc(this._remoteSource);

  @override
  void mapEventToState(DetailMovieEvent event) {
    if (event is GetDetailMovieEvent) {
      _getDetailMovie(event.movieId);
    }
  }

  void _getDetailMovie(int movieId) async {
    final result = await _remoteSource.fetchDetailMovies(movieId);

    responseHandler<DetailMovieResponse>(result, onSuccess: (response) {
      emitState(SuccessGetDetailMovieState(response));
    }, onError: (dioError, code, errorBody) {
      emitState(FailedGetDetailMovieState("Error $code ==> $errorBody"));
    });
  }
}
