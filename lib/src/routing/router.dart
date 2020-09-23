import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/detail/detail_movie_screen.dart';
import '../ui/home/bloc/home_bloc.dart';
import '../ui/home/home_screen.dart';
import '../ui/detail/bloc/detail_movie_bloc.dart';
import '../common/data/remote/movie_remote_source.dart';
import '../common/data/local/db/database_module.dart';
import '../common/data/movie_repository.dart';
import 'routing_constant.dart';
import 'undefined_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routing.ROOT:
        return MaterialPageRoute(
          builder: (_) => ProxyProvider<MovieRepository, HomeBloc>(
              update: (context, repos, homeBloc) => HomeBloc(repos),
              child: HomeScreen()),
        );

      case Routing.DETAIL_MOVIE:
        Movie movie = settings.arguments as Movie;
        return MaterialPageRoute(
            builder: (_) => ProxyProvider<MovieRemoteSource, DetailMovieBloc>(
                  update: (context, movieRemote, detailBloc) =>
                      DetailMovieBloc(movieRemote),
                  child: DetailMovieScreen(movie),
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => UndefinedView(
                  routeName: settings.name,
                ));
    }
  }
}
