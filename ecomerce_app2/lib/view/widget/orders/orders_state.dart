import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersState extends StatelessWidget {
  final String title;
  const OrdersState({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 3.h),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
      ),
    );
  }
}
