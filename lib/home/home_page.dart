import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/api_request/models/product_viewdata.dart';
import 'package:shopping_cart/api_request/usecase/products_usecase_provider.dart';
import 'package:shopping_cart/home/widgets/list_view_icons.dart';
import 'package:shopping_cart/home/widgets/list_view_products.dart';
import 'package:shopping_cart/home/widgets/row_text_form_field_and_icons.dart';
import 'package:shopping_cart/home/widgets/slider_photos.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProductsProvider = ref.watch(productsProvider);
    return Scaffold(
      body: SafeArea(
        child: getProductsProvider.when(
          data: (data) {
            return Column(
              children: [
                const RowTextFormFieldAndIcons(),
                const SliderPhotos(),
                ListViewIcons(getProductsProvider: getProductsProvider),
                ListViewProducts(getProductsProvider: getProductsProvider)
              ],
            );
          },
          error: (error, stackTrace) {
            return const Text('Errooooooooooooooo');
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

List<String> addCategory(List products) {
  List<String> categories = [];

  for (ProductViewData product in products) {
    if (!categories.contains(product.category)) {
      categories.add(product.category);
    }
  }
  return categories;
}

Icon selectIcon(String category) {
  Icon icon = const Icon(Icons.abc);
  switch (category) {
    case "smartphones":
      icon = const Icon(Icons.phone);
      break;
    case "laptops":
      icon = const Icon(Icons.laptop);
      break;
    case "fragrances":
      icon = const Icon(Icons.air_outlined);
      break;
    case "skincare":
      icon = const Icon(Icons.accessibility);
      break;
    case "groceries":
      icon = const Icon(Icons.local_grocery_store);
      break;
    case "home-decoration":
      icon = const Icon(Icons.home);
  }

  return icon;
}
