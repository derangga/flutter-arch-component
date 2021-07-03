import 'package:flutter/foundation.dart';
import 'package:flutter_arch_component/src/common/domain/repository/movie_repository.dart';
import '../../../base/base_bloc.dart';
import '../../../base/bloc_event.dart';
import '../../../base/bloc_state.dart';
import '../../../common/domain/models/remote/detail_movie_response.dart';
import '../../../utils/extension.dart';

part 'detail_movie_event.dart';

part 'detail_movie_state.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {
  late final MovieRepository _repository;

  DetailMovieBloc(this._repository) : super(LoadingViewState());

  @override
  Stream<DetailMovieState> mapEventToState(DetailMovieEvent event) async* {
    if (event is GetDetailMovieEvent) {
      yield LoadingViewState();
      final result =
          await _repository.fetchDetailMovies(event.movieId.orZero());
      yield* result.fold((failure) async* {
        yield FailedGetDetailMovieState(
            "Error ${failure.code} ==> ${failure.errorBody}");
      }, (success) async* {
        yield SuccessGetDetailMovieState(success);
      });
    }
  }
}
