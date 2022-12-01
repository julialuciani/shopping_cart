import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/api_request/usecase/products_usecase_provider.dart';

import 'fake_repository.dart';

class SetupWhenWidgetTester extends StatelessWidget {
  final Widget child;
  const SetupWhenWidgetTester({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        productsProvider.overrideWith((ref) => [first, second]),
      ],
      child: MaterialApp(
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: child,
          ),
        ),
      ),
    );
  }
}

Future<void> loadPageWhen(WidgetTester tester, Widget child) async {
  var widget = SetupWhenWidgetTester(
    child: child,
  );
  await tester.pumpWidget(widget);
}
