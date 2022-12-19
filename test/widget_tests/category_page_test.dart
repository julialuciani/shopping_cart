import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:shopping_cart/cagory_page/category_page.dart';
import 'package:shopping_cart/home/widgets/list_view_products.dart';

import '../shared/setup_when_widget_tester.dart';

void main() {
  group("WHEN calls CategoryPage THEN test it", () {
    testWidgets("WHEN calls CategoryPage THEN ensure to find all its widgets",
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await loadPageWhen(tester, const CategoryPage());

        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byType(Column), findsWidgets);
        expect(find.byType(Expanded), findsWidgets);
        expect(find.byType(ListViewProducts), findsWidgets);
      });
    });
  });
}
