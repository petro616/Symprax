import 'package:flutter/material.dart';

class SubtitleListtile extends StatelessWidget {
  final String title;
  const SubtitleListtile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
    );
  }
}
