import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopping_cart/api_request/models/product_viewdata.dart';
import 'package:shopping_cart/home/provider.dart';

class RowTextFormFieldAndIcons extends ConsumerStatefulWidget {
  List<ProductViewData> products;
  RowTextFormFieldAndIcons({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  ConsumerState<RowTextFormFieldAndIcons> createState() =>
      _RowTextFormFieldAndIconsState();
}

class _RowTextFormFieldAndIconsState
    extends ConsumerState<RowTextFormFieldAndIcons> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.read(getFilteredProducts.notifier).state = widget.products;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Mercadoria",
              ),
              controller: _controller,
              onChanged: (value) {
                ref.read(getFilteredProducts.notifier).state =
                    filterText(_controller.text, widget.products);
                setState(() {});
              },
            ),
          ),
          const Icon(
            Icons.shopping_basket,
            color: Colors.blue,
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.chat,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

List<ProductViewData> filterText(
    String controller, List<ProductViewData> products) {
  List<ProductViewData> productsFiltered = [];
  for (ProductViewData product in products) {
    if (controller.toLowerCase() == product.brand.toLowerCase()) {
      productsFiltered.add(product);
    } else if (controller.toLowerCase() == product.title.toLowerCase()) {
      productsFiltered.add(product);
    } else if (controller.toLowerCase() == product.category.toLowerCase()) {
      productsFiltered.add(product);
    } else if (controller.toLowerCase() == product.description.toLowerCase()) {
      productsFiltered.add(product);
    }
  }
  return productsFiltered.isNotEmpty ? productsFiltered : products;
}
