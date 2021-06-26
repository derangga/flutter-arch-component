import 'package:flutter/material.dart';
import 'package:flutter_arch_component/src/ui/detail/bloc/detail_movie_bloc.dart';
import 'package:flutter_arch_component/src/ui/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

import 'src/di/injection.dart';
import 'src/routing/router.dart';
import 'src/routing/routing_constant.dart';

void main() {
  AppModule.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (ctx) => KiwiContainer().resolve<HomeBloc>()),
        BlocProvider<DetailMovieBloc>(create: (ctx) => KiwiContainer().resolve<DetailMovieBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Clean Arch Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: RoutingApp.generateRoute,
        initialRoute: Routing.ROOT,
      ),
    );
  }
}
