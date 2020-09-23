part of 'home_bloc.dart';

@immutable
abstract class HomeState extends BlocState {}

class LoadingState extends HomeState {}

class SuccessGetDiscoverState extends HomeState {
  final List<Movie> movieList;
  SuccessGetDiscoverState(this.movieList);
}

class FailedGetDiscoverState extends HomeState {
  final String message;
  final List<Movie> movieList;
  FailedGetDiscoverState(this.message, this.movieList);
}
