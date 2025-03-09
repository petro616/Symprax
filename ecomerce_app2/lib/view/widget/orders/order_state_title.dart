import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStateTitle extends StatelessWidget {
  final String title;
  const OrderStateTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21.sp,
          fontFamily: "BebasNeue",
          color: Colors.blueGrey),
    );
  }
}
