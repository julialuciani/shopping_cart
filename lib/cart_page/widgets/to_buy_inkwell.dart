import 'package:flutter/material.dart';

class ToBuyInkWell extends StatelessWidget {
  const ToBuyInkWell({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        Navigator.pushNamed(context, "/confirmation-page");
      },
      child: const Chip(
        labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        backgroundColor: Colors.white,
        side: BorderSide(width: 1, color: Colors.blue),
        label: Text(
          "Comprar",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
