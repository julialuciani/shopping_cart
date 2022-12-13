import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/details_page/providers.dart';

class AppBarDetails extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AppBarDetails({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);

  @override
  ConsumerState<AppBarDetails> createState() => _StateAppBarDetails();
}

class _StateAppBarDetails extends ConsumerState<AppBarDetails> {
  @override
  Widget build(BuildContext context) {
    final cartList = ref.watch(cartProvider);

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
                    cartList.length.toString(),
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
