import 'package:flutter/material.dart';

import '../../api_request/models/product_viewdata.dart';

class ListViewProducts extends StatelessWidget {
  const ListViewProducts({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<ProductViewData> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          List<String> images = data[index].images;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  data[index].title,
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
                  itemCount: data[index].images.length,
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
                      onTap: () {
                        Navigator.pushNamed(context, "details-page",
                            arguments: data[index]);
                      },
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
