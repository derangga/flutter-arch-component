import 'package:flutter/foundation.dart';

import '../../../base/bloc_event.dart';
import '../../../base/bloc_state.dart';
import '../../../base/base_bloc.dart';
import '../../../common/data/local/db/database_module.dart';
import '../../../common/domain/repository/movie_repository.dart';

part 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  late final MovieRepository _repos;
  bool isOnProcess = false;

  HomeBloc(this._repos) : super(LoadingState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetDiscoverMovieEvent) {
      yield* _repos.singleSourceOfTruth<HomeState>(1,
          (movies) async* {
            yield SuccessGetDiscoverState(movies);
          },
          (message, movies) async* {
            yield FailedGetDiscoverState(message, movies);
          });
    }
  }

}
