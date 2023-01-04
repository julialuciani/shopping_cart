import 'package:flutter/material.dart';
import 'package:shopping_cart/cagory_page/category_page.dart';
import 'package:shopping_cart/cart_page/cart_page.dart';
import 'package:shopping_cart/confirmation_page/confirmation_page.dart';
import 'package:shopping_cart/details_page/details_page.dart';
import 'package:shopping_cart/home/home_page.dart';
import 'package:shopping_cart/login_page/login_page.dart';
import 'package:shopping_cart/payment_page/payment_page.dart';
import 'package:shopping_cart/sign_up_page/sign_up_page.dart';
import 'package:shopping_cart/sucesspage/sucess_page.dart';

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
    } else if (settings.name == PaymentPage.route) {
      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
        return PaymentPage();
      });
    } else if (settings.name == SucessPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const SucessPage();
        },
      );
    } else if (settings.name == LoginPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const LoginPage();
        },
      );
    } else if (settings.name == SignUpPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return SignUpPage();
        },
      );
    }
    return null;
  }
}
