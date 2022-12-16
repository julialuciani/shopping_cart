import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:shopping_cart/cart_page/cart_page.dart';
import 'package:shopping_cart/cart_page/widgets/add_or_remove_container.dart';
import 'package:shopping_cart/cart_page/widgets/list_view_cart_products.dart';
import 'package:shopping_cart/cart_page/widgets/row_total.dart';
import 'package:shopping_cart/cart_page/widgets/to_buy_inkwell.dart';

import '../shared/fake_repository.dart';
import '../shared/setup_widget_tester.dart';

void main() {
  group('WHEN calls CartPage THEN test all its widgets', () {
    testWidgets("WHEN calls CartPage THEN expect to find all its widgets",
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await loadPage(tester, const CartPage());

        await tester.pumpAndSettle();

        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byType(Text), findsWidgets);
        expect(find.byType(Column), findsWidgets);
        expect(find.byType(Expanded), findsWidgets);
        expect(find.byType(Padding), findsWidgets);
        expect(find.byType(ListViewCartProducts), findsOneWidget);
        expect(find.byType(Divider), findsWidgets);
        expect(find.byType(RowTotal), findsOneWidget);
        expect(find.byType(ToBuyInkWell), findsOneWidget);

        await tester.tap(find.byType(ToBuyInkWell));
      });
    });

    testWidgets("WHEN calls AddOrRemoveContainer THEN test its widgets",
        (WidgetTester tester) async {
      await loadPage(tester,
          AddOrRemoveContainer(product: first, products: [first, second]));

      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(InkWell), findsWidgets);
      expect(find.byType(SizedBox), findsWidgets);

      await tester.tap(find.byIcon(Icons.add));
      await tester.tap(find.byIcon(Icons.remove));
    });

    testWidgets("WHEN calls ListViewProducts THEN tests its widgets",
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await loadPage(
            tester, ListViewCartProducts(cartProducts: [first, second]));

        expect(find.byType(Divider), findsWidgets);
        expect(find.byType(Padding), findsWidgets);
        expect(find.byType(Row), findsWidgets);
        expect(find.byType(Column), findsWidgets);
        expect(find.byType(Spacer), findsWidgets);
        expect(find.byType(SizedBox), findsWidgets);
        expect(find.byType(AddOrRemoveContainer), findsWidgets);
      });
    });
  });
}
