import 'package:flutter/foundation.dart';
import '../../../base/base_bloc.dart';
import '../../../base/bloc_event.dart';
import '../../../base/bloc_state.dart';
import '../../../common/domain/detail_movie_response.dart';
import '../../../common/data/remote/config/network_func.dart';
import '../../../common/data/remote/movie_remote_source.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {

  final MovieRemoteSource _remoteSource;

  DetailMovieBloc(this._remoteSource);

  @override
  void mapEventToState(DetailMovieEvent event) {
    if(event is GetDetailMovieEvent){
      _getDetailMovie(event.movieId);
    }
  }

  void _getDetailMovie(int movieId) async {
    final result = await _remoteSource.fetchDetailMovies(movieId);

    responseHandler<DetailMovieResponse>(result, onSuccess: (response){
      emitState(SuccessGetDetailMovieState(response));
    }, onError: (dioError, code, errorBody){
      emitState(FailedGetDetailMovieState("Error $code ==> $errorBody"));
    });
  }
}