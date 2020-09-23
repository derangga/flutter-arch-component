import 'package:flutter/foundation.dart';

import '../../../base/bloc_event.dart';
import '../../../base/bloc_state.dart';
import '../../../base/base_bloc.dart';
import '../../../common/data/local/db/database_module.dart';
import '../../../common/data/movie_repository.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final MovieRepository _repos;
  bool isOnProcess = false;

  HomeBloc(this._repos);

  @override
  void mapEventToState(HomeEvent event) {
    if (event is GetDiscoverMovieEvent && !isOnProcess) {
      isOnProcess = true;
      _getDiscover();
    }
  }

  void _getDiscover() async {
    await _repos.singleSourceOfTruth(
        page: 1,
        onSuccess: (movieList) {
          emitState(SuccessGetDiscoverState(movieList));
        },
        onError: (message, movieList) {
          emitState(FailedGetDiscoverState(message, movieList));
        });
    isOnProcess = false;
  }
}
