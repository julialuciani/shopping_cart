import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopping_cart/details_page/providers.dart';

class AppBarDetails extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarDetails({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 20,
      iconTheme: const IconThemeData(color: Colors.blue),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Detalhes",
            style: TextStyle(color: Colors.blue),
          ),
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("cart-page");
                  },
                  icon: const Icon(Icons.shopping_cart, color: Colors.blue)),
              Positioned(
                right: 1,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.red,
                  child: Text(
                    ref.watch(numberOfProducts).toString(),
                    style: const TextStyle(
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
