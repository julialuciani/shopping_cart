import 'package:flutter/material.dart';

import 'package:shopping_cart/api_request/models/product_viewdata.dart';

import '../home/widgets/slider_photos.dart';

class DetailsPage extends StatelessWidget {
  final ProductViewData product;
  static const route = "details-page";
  const DetailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliderPhotos(images: product.images),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    product.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(product.brand),
                  trailing: Text(product.rating.toString()),
                ),
                ListTile(
                  title: const Text('Descrição'),
                  subtitle: Text(product.description),
                ),
                ListTile(
                  title: Row(
                    children: [
                      const Text('Preço'),
                      const Spacer(),
                      Text(product.price.toString()),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      const Text('Desconto'),
                      const Spacer(),
                      Text(product.discountPercentage.toString()),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Estoque'),
                  trailing: Text(product.stock.toString()),
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
