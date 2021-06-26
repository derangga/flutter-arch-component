part of 'detail_movie_bloc.dart';

@immutable
abstract class DetailMovieEvent extends BlocEvent{}

class GetDetailMovieEvent extends DetailMovieEvent {
  final int? movieId;
  GetDetailMovieEvent(this.movieId);
}