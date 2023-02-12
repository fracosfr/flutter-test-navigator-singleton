import 'package:flutter/material.dart';
import 'package:fracosfr/router/navigation_delegate.dart';
import 'package:fracosfr/router/navigation_route_parser.dart';

void main() {
  //setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationDelegate = NavigationDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FRACOS.FR',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      routeInformationParser: NavigationRouteParser(),
      routerDelegate: navigationDelegate,
    );
  }
}
