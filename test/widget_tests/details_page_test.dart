import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:shopping_cart/api_request/models/product_viewdata.dart';
import 'package:shopping_cart/details_page/details_page.dart';
import 'package:shopping_cart/details_page/widgets/app_bar_details.dart';
import 'package:shopping_cart/details_page/widgets/carousel_slider_details.dart';
import 'package:shopping_cart/details_page/widgets/rating_stars.dart';
import 'package:shopping_cart/details_page/widgets/shopping_cart_inkwell.dart';

import '../shared/setup_widget_tester.dart';

void main() {
  testWidgets('WHEN calls DetailsPage THEN check if it has all it needs',
      (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, DetailsPage(product: product));

      expect(find.byType(Scaffold), findsWidgets);
      expect(find.byType(AppBarDetails), findsWidgets);
      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(CarouselSliderDetails), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(ListTile), findsWidgets);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(Row), findsWidgets);
      expect(find.byType(RatingStars), findsWidgets);
      expect(find.byType(Spacer), findsWidgets);
      expect(find.byType(ShoppingCartInkWell), findsWidgets);

      await tester.tap(find.byType(ShoppingCartInkWell));
      await tester.pumpAndSettle();
    });
  });
}

ProductViewData product = ProductViewData(
  id: 1,
  title: 'title',
  description: 'description',
  price: 6.5,
  discountPercentage: 5.8,
  rating: 4.5,
  stock: 3,
  brand: 'brand',
  category: 'category',
  thumbnail: 'thumbnail',
  images: ["https://i.dummyjson.com/data/products/1/1.jpg"],
);
