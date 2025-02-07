import 'package:flutter/material.dart';

class SubtitleListTileForItems extends StatelessWidget {
  final String title;
  const SubtitleListTileForItems({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
    );
  }
}
