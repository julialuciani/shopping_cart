import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/cagory_page/providers.dart';
import 'package:shopping_cart/home/widgets/list_view_products.dart';

class CategoryPage extends ConsumerWidget {
  static const route = "/category-page";
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(categoryProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.white,
        title: Text(
          products[0].category,
          style: const TextStyle(color: Colors.blue),
        ),
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListViewProducts(
              data: products,
            ),
          )
        ],
      ),
    );
  }
}
