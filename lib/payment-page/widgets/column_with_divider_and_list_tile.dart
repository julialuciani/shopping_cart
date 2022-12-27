import 'package:flutter/material.dart';

class ColumnWithDividerAndListTile extends StatelessWidget {
  final String title;
  final String image;
  const ColumnWithDividerAndListTile({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1,
        ),
        ListTile(
          leading: Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          trailing: Image.asset(image),
        ),
      ],
    );
  }
}
