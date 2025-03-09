import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WhiteSpaceForElementsCart extends StatelessWidget {
  final Widget? widget;
  const WhiteSpaceForElementsCart({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(50.r, 50.r),
            bottomRight: Radius.elliptical(100.r, 100.r),
          ),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(top: 50.h, left: 8.w, right: 8.w, bottom: 15.h),
        width: Get.width.w,
        child: widget);
  }
}
