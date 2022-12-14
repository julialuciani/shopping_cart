import 'package:flutter/material.dart';
import 'package:shopping_cart/cart_page/widgets/add_or_remove_container.dart';

import '../../api_request/models/product_viewdata.dart';

class ListViewCartProducts extends StatelessWidget {
  const ListViewCartProducts({
    Key? key,
    required this.cartProducts,
  }) : super(key: key);

  final List<ProductViewData> cartProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: cartProducts.length,
      itemBuilder: (context, index) {
        ProductViewData cartProduct = cartProducts[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartProduct.title),
                  Text(cartProduct.brand),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: Image.network(cartProduct.thumbnail),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              AddOrRemoveContainer(
                product: cartProduct,
                products: cartProducts,
              ),
            ],
          ),
        );
      },
    );
  }
}
