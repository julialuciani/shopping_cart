import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart/cart_page/providers.dart';

import '../../details_page/details_page.dart';

class RowTotal extends ConsumerWidget {
  const RowTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Total: "),
        Text(formatCurrency(ref.watch(totalProvider))),
      ],
    );
  }
}
