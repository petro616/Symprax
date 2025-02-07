import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Choosetext extends StatelessWidget {
  final String title;
  const Choosetext({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 8.h),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ));
  }
}
