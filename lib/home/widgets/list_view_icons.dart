import 'package:flutter/material.dart';

import '../../api_request/models/product_viewdata.dart';
import '../home_page.dart';

class ListViewIcons extends StatelessWidget {
  const ListViewIcons({
    Key? key,
    required this.getProductsProvider,
  }) : super(key: key);

  final List<ProductViewData> getProductsProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        scrollDirection: Axis.horizontal,
        itemCount: addCategory(getProductsProvider).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.black12),
                  ),
                  child: selectIcon(addCategory(getProductsProvider)[index]),
                ),
                const SizedBox(height: 10),
                Text(addCategory(getProductsProvider)[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}