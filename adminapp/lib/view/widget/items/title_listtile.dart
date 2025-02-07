import 'package:flutter/material.dart';

class TitleListtileForItems extends StatelessWidget {
  final String title;
  const TitleListtileForItems({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
