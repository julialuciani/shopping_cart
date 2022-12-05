import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:shopping_cart/api_request/models/product_viewdata.dart';
import 'package:shopping_cart/details_page/widgets/app_bar_details.dart';
import 'package:shopping_cart/details_page/widgets/carousel_slider_details.dart';
import 'package:shopping_cart/details_page/widgets/rating_stars.dart';
import 'package:shopping_cart/details_page/widgets/shopping_cart_inkwell.dart';

class DetailsPage extends StatefulHookConsumerWidget {
  final ProductViewData product;
  static const route = "details-page";
  const DetailsPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  ConsumerState<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDetails(ref: ref),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSliderDetails(product: widget.product),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.product.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.product.brand),
                        RatingStars(rating: widget.product.rating),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text('Descrição'),
                    subtitle: Text(widget.product.description),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        const Text('Preço'),
                        const Spacer(),
                        Text(formatCurrency(widget.product.price)),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        const Text('Desconto'),
                        const Spacer(),
                        Text(
                            '${widget.product.discountPercentage.toString()}%'),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text('Estoque'),
                    trailing: Text(widget.product.stock.toString()),
                  ),
                  ListTile(
                    title: const Text("Preço total"),
                    trailing: Text(
                      formatCurrency(
                        getTotalPriceMinusDiscount(widget.product.price,
                            widget.product.discountPercentage),
                      ),
                    ),
                  ),
                  ShoppingCartInkWell(ref: ref)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double getTotalPriceMinusDiscount(double price, double discount) {
  double discountInPrice = 0;
  discountInPrice = (price * discount) / 100;
  return price - discountInPrice;
}

String formatCurrency(double value) {
  return NumberFormat.simpleCurrency(locale: "pt-BR", decimalDigits: 2)
      .format(value);
}

int isStarHalf(double rating) {
  if (rating.toInt() - rating != 0) {
    return rating.toInt() + 1;
  } else {
    return 0;
  }
}
