import 'package:flutter/material.dart';

import '../../api_request/models/product_viewdata.dart';

class ListViewProducts extends StatelessWidget {
  const ListViewProducts({
    Key? key,
    required this.getProductsProvider,
  }) : super(key: key);

  final List<ProductViewData> getProductsProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ListView.builder(
        itemCount: getProductsProvider.length,
        itemBuilder: (context, index) {
          List<String> images = getProductsProvider[index].images;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  getProductsProvider[index].title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getProductsProvider[index].images.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 200,
                      child: Image.network(images[index]),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Chip(
                        side: BorderSide(width: 2, color: Colors.blue),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        backgroundColor: Colors.white,
                        label: Text(
                          "Detalhes",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}