import 'package:flutter/material.dart';

class TestAppWidget extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const TestAppWidget({Key? key, required this.body, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: body,
      ),
    );
  }
}
