import 'package:flutter/material.dart';
import 'package:shopping_cart/home/home_page.dart';

class GenerateRoute {
  static Route<dynamic>? findRoute(settings) {
    if (settings.name == HomePage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const HomePage();
        },
      );
    }
    return null;
  }
}
