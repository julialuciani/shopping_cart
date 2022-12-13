import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/api_request/models/product_viewdata.dart';
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
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                ProductViewData cartProduct = cartProducts[index];
                return ListTile(
                  title: Text(cartProduct.title),
                  subtitle: Text(cartProduct.brand),
                  trailing: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.network(cartProduct.thumbnail),
                      ),
                      const SizedBox(height: 10),
                      Text('${cartProduct.price} x ${cartProduct.quantity}'),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total: "),
                    Text(calculateTotal(cartProducts).toString()),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              splashFactory: NoSplash.splashFactory,
              onTap: () {},
              child: const Chip(
                labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                backgroundColor: Colors.white,
                side: BorderSide(width: 1, color: Colors.blue),
                label: Text(
                  "Comprar",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

double calculateTotal(List<ProductViewData> products) {
  double total = 0;
  for (ProductViewData product in products) {
    total += product.price;
  }
  return total;
}
