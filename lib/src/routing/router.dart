import 'package:flutter/material.dart';

import '../ui/detail/detail_movie_screen.dart';
import '../ui/home/home_screen.dart';
import '../common/data/local/db/database_module.dart';
import 'routing_constant.dart';
import 'undefined_view.dart';

class RoutingApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routing.ROOT:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

      case Routing.DETAIL_MOVIE:
        Movie? movie = settings.arguments as Movie;
        return MaterialPageRoute(
            builder: (_) => DetailMovieScreen(movie));

      default:
        return MaterialPageRoute(
            builder: (_) => UndefinedView(
                  routeName: settings.name,
                ));
    }
  }
}
