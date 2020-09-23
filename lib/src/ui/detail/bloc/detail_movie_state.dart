part of 'detail_movie_bloc.dart';

@immutable
abstract class DetailMovieState extends BlocState {}

class LoadingViewState extends DetailMovieState{}

class SuccessGetDetailMovieState extends DetailMovieState {
  final DetailMovieResponse detailMovie;
  SuccessGetDetailMovieState(this.detailMovie);
}

class FailedGetDetailMovieState extends DetailMovieState {
  final String message;
  FailedGetDetailMovieState(this.message);
}