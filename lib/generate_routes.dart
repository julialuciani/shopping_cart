import 'package:flutter/material.dart';
import 'package:shopping_cart/details_page/details_page.dart';
import 'package:shopping_cart/home/home_page.dart';

class GenerateRoute {
  static Route<dynamic>? findRoute(settings) {
    if (settings.name == HomePage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const HomePage();
        },
      );
    } else if (settings.name == DetailsPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const DetailsPage();
        },
      );
    }
    return null;
  }
}
