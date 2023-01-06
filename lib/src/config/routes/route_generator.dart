import 'package:flutter/material.dart';
import 'package:testapp/src/app.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings route) {
    switch (route.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const MyApp(),
          settings: route,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const MyApp(),
          settings: route,
        );
    }
  }
}
