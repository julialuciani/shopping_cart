import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/api_request/models/product_viewdata.dart';
import 'package:shopping_cart/details_page/providers.dart';

class ShoppingCartInkWell extends ConsumerStatefulWidget {
  final ProductViewData product;
  const ShoppingCartInkWell({
    required this.product,
    super.key,
  });

  @override
  ConsumerState<ShoppingCartInkWell> createState() =>
      _ShoppingCartInkWellState();
}

class _ShoppingCartInkWellState extends ConsumerState<ShoppingCartInkWell> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.read(cartProvider);
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        ref.read(cartProvider.notifier).state =
            _addQuantityToProduct(widget.product, cartProducts);

        ref.read(numberOfProducts.notifier).state++;
      },
      child: Chip(
        side: const BorderSide(width: 2, color: Colors.blue),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(10),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.add,
              color: Colors.blue,
            ),
            Icon(
              Icons.shopping_cart,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

List<ProductViewData> _addQuantityToProduct(
    ProductViewData product, List<ProductViewData> productsInCart) {
  if (!productsInCart.contains(product)) {
    product.quantity = 1;
    productsInCart.add(product);
  } else {
    product.quantity++;
  }
  return productsInCart;
}
