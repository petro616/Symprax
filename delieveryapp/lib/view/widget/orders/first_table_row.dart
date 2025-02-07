import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleTableRow extends StatelessWidget {
  final String title;
  const TitleTableRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            height: 1.5.h));
  }
}
