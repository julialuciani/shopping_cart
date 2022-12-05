import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../api_request/models/product_viewdata.dart';

class CarouselSliderDetails extends StatelessWidget {
  final ProductViewData product;
  const CarouselSliderDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: product.images.length,
      itemBuilder: (context, index, realIndex) {
        return Image.network(
          product.images[index],
          fit: BoxFit.cover,
        );
      },
      options: CarouselOptions(
        height: 180,
      ),
    );
  }
}
