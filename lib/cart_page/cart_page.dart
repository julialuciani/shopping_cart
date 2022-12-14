import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/cart_page/widgets/list_view_cart_products.dart';
import 'package:shopping_cart/cart_page/widgets/row_total.dart';
import 'package:shopping_cart/cart_page/widgets/to_buy_inkwell.dart';
import 'package:shopping_cart/details_page/providers.dart';

class CartPage extends ConsumerStatefulWidget {
  static const route = "cart-page";

  const CartPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: const Text(
          'Meu carrinho',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListViewCartProducts(cartProducts: cartProducts),
          ),
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: RowTotal(ref: ref),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: ToBuyInkWell(),
          )
        ],
      ),
    );
  }
}