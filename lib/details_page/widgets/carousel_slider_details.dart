import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderDetails extends StatelessWidget {
  final List<String> images;
  const CarouselSliderDetails({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        return Image.network(
          images[index],
          fit: BoxFit.cover,
        );
      },
      options: CarouselOptions(
        height: 180,
      ),
    );
  }
}
