import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/details_page/providers.dart';

class ShoppingCartInkWell extends StatelessWidget {
  const ShoppingCartInkWell({
    Key? key,
    required this.ref,
  }) : super(key: key);

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        ref.read(cartProvider.notifier).state++;
      },
      child: Chip(
          side: const BorderSide(width: 2, color: Colors.blue),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
          )),
    );
  }
}
