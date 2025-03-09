import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataTableRow extends StatelessWidget {
  final String title;
  const DataTableRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, height: 2.h));
  }
}
