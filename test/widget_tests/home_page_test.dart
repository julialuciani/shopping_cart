import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:shopping_cart/home/home_page.dart';
import 'package:shopping_cart/home/widgets/list_view_icons.dart';
import 'package:shopping_cart/home/widgets/list_view_products.dart';
import 'package:shopping_cart/home/widgets/row_text_form_field_and_icons.dart';
import 'package:shopping_cart/home/widgets/slider_photos.dart';

import '../shared/fake_repository.dart';
import '../shared/setup_when_widget_tester.dart';
import '../shared/setup_widget_tester.dart';

void main() {
  testWidgets("WHEN calls HomePage THEN see if its has all the widgets",
      (WidgetTester tester) async {
    await mockNetworkImagesFor(
      () async {
        await loadPageWhen(tester, const HomePage());

        expect(find.byType(Scaffold), findsWidgets);
        expect(find.byType(Column), findsWidgets);
        expect(find.byType(RowTextFormFieldAndIcons), findsWidgets);
        expect(find.byType(SliderPhotos), findsWidgets);
        expect(find.byType(ListViewIcons), findsWidgets);
        expect(find.byType(ListViewProducts), findsWidgets);
        expect(find.byType(SingleChildScrollView), findsOneWidget);
      },
    );
  });

  testWidgets("WHEN calls HomePage THEN see if get error",
      (WidgetTester tester) async {
    await loadPage(tester, const HomePage());
    await tester.pumpAndSettle();
    expect(find.byType(Text), findsOneWidget);
  });

  testWidgets("WHEN calls SliderPhotos THEN test if it works",
      (WidgetTester tester) async {
    await loadPage(
        tester,
        const SliderPhotos(
          images: [
            "assets/images/thumb-magalu.png",
            "assets/images/sigaalunasredessociaismagazineluizamagalu.png",
            "assets/images/Magalu_SmartphonizaBrasil_575.jpg",
            "assets/images/regulamentos.png",
            "assets/images/KV_02_rio.jpeg",
          ],
        ));

    await tester.drag(find.byType(Image).first, const Offset(200, 0));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(CircleAvatar).last);
    await tester.pumpAndSettle();
  });

  testWidgets("WHEN calling ListViewProducts THEN tap details button",
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, ListViewProducts(data: [first, second]));

      await tester.tap(find.byType(InkWell).first);
      await tester.pumpAndSettle();
    });
  });
}
