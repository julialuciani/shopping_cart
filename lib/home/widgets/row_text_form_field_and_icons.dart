import 'package:flutter/material.dart';

class RowTextFormFieldAndIcons extends StatelessWidget {
  const RowTextFormFieldAndIcons({
    Key? key,
  }) : super(key: key);

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
            ),
          ),
          const Icon(Icons.shopping_basket),
          const Icon(Icons.chat),
        ],
      ),
    );
  }
}
