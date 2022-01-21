import 'package:flutter/material.dart';
import 'package:friendly_fire_web_app/src/routes/route_parser.dart';
import 'package:friendly_fire_web_app/src/routes/router_delegate.dart';
import 'package:provider/provider.dart';

class FriendlyFireApp extends StatelessWidget {
  FriendlyFireApp({Key? key}) : super(key: key);
  final routerParser = RouteParser();
  final routerDelegate = MyRouterDelegate();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: routerDelegate,
      child: MaterialApp.router(
        title: 'Friendly Fire App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: routerParser,
        routerDelegate: routerDelegate,
      ),
    );
  }
}
