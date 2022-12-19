import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/cagory_page/providers.dart';

import '../../api_request/models/product_viewdata.dart';
import '../home_page.dart';

class ListViewIcons extends ConsumerStatefulWidget {
  const ListViewIcons({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<ProductViewData> data;

  @override
  ConsumerState<ListViewIcons> createState() => _ListViewIconsState();
}

class _ListViewIconsState extends ConsumerState<ListViewIcons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        scrollDirection: Axis.horizontal,
        itemCount: addCategory(widget.data).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    ref.read(categoryProvider.notifier).state =
                        selectProductsByCategory(
                            widget.data, addCategory(widget.data)[index]);
                    Navigator.pushNamed(context, "/category-page",
                        arguments: addCategory(widget.data)[index]);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: Colors.black12),
                    ),
                    child: selectIcon(addCategory(widget.data)[index]),
                  ),
                ),
                const SizedBox(height: 10),
                Text(addCategory(widget.data)[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<ProductViewData> selectProductsByCategory(
    List<ProductViewData> allProducts, String category) {
  List<ProductViewData> productsByCategory = [];
  for (ProductViewData product in allProducts) {
    if (product.category == category) {
      productsByCategory.add(product);
    }
  }
  return productsByCategory;
}
