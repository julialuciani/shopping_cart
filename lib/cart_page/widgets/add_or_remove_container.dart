import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopping_cart/api_request/models/product_viewdata.dart';
import 'package:shopping_cart/cart_page/providers.dart';

class AddOrRemoveContainer extends ConsumerStatefulWidget {
  final ProductViewData product;
  final List<ProductViewData> products;
  const AddOrRemoveContainer({
    Key? key,
    required this.product,
    required this.products,
  }) : super(key: key);

  @override
  ConsumerState<AddOrRemoveContainer> createState() =>
      _AddOrRemoveContainerState();
}

class _AddOrRemoveContainerState extends ConsumerState<AddOrRemoveContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 30,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Colors.blue),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                addQuantity(widget.product);
                ref.read(totalProvider.notifier).state =
                    calculateTotal(widget.products);
                setState(() {});
              },
              child: const Icon(Icons.add, size: 20, color: Colors.blue)),
          SizedBox(
            height: 14,
            child: Text(widget.product.quantity.toString()),
          ),
          InkWell(
              onTap: () {
                subtractQuantity(widget.product);
                ref.read(totalProvider.notifier).state =
                    calculateTotal(widget.products);
                setState(() {});
              },
              child: const Icon(Icons.remove, size: 20, color: Colors.blue)),
        ],
      ),
    );
  }
}

void addQuantity(ProductViewData product) {
  product.quantity++;
}

void subtractQuantity(ProductViewData product) {
  product.quantity--;
}

double calculateTotal(List<ProductViewData> products) {
  double total = 0;
  for (ProductViewData product in products) {
    total += product.price * product.quantity;
  }
  return total;
}
