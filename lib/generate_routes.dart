import 'package:flutter/material.dart';
import 'package:shopping_cart/cagory_page/category_page.dart';
import 'package:shopping_cart/cart_page/cart_page.dart';
import 'package:shopping_cart/confirmation_page/confirmation_page.dart';
import 'package:shopping_cart/details_page/details_page.dart';
import 'package:shopping_cart/home/home_page.dart';

import 'api_request/models/product_viewdata.dart';

class GenerateRoute {
  static Route<dynamic>? findRoute(settings) {
    if (settings.name == HomePage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const HomePage();
        },
      );
    } else if (settings.name == DetailsPage.route) {
      final args = settings.arguments as ProductViewData;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return DetailsPage(
            product: args,
          );
        },
      );
    } else if (settings.name == CartPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const CartPage();
        },
      );
    } else if (settings.name == CategoryPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const CategoryPage();
        },
      );
    } else if (settings.name == ConfirmationPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const ConfirmationPage();
        },
      );
    }
    return null;
  }
}
