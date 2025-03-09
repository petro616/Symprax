import 'package:flutter/material.dart';

class TitleListtile extends StatelessWidget {
  final String title;
  const TitleListtile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
