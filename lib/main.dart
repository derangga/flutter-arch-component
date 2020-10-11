import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/di/injection.dart';
import 'src/routing/router.dart';
import 'src/routing/routing_constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appServices,
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
