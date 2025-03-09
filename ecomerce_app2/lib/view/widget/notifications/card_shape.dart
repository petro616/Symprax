import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardShape extends StatelessWidget {
  final Widget? widget;
  const CardShape({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(20.r, 20.r),
                topRight: Radius.elliptical(45.r, 45.r),
                bottomRight: Radius.elliptical(20.r, 20.r),
                bottomLeft: Radius.elliptical(45.r, 45.r))),
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        color: Colors.white,
        child: widget);
  }
}
