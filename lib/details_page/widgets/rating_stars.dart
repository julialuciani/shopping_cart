import 'package:flutter/material.dart';
import 'package:shopping_cart/details_page/details_page.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  const RatingStars({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              width: 120,
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: Colors.grey.shade100,
                  );
                },
              ),
            ),
            Text(
              '${rating.toString()}/5.00',
              style: const TextStyle(color: Colors.amber),
            ),
          ],
        ),
        Positioned(
          child: SizedBox(
            width: 120,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rating.toInt(),
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
            ),
          ),
        ),
        Positioned(
          child: SizedBox(
            width: 120,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: isStarHalf(rating),
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star_half_sharp,
                  color: Colors.amber,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
