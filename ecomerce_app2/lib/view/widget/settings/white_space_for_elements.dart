import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WhiteSpaceForElementsSettings extends StatelessWidget {
  final Widget? widget;
  const WhiteSpaceForElementsSettings({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r)),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: 50.h, left: 8.w, right: 8.w),
      height: 800.h,
      width: Get.width,
      child: widget,
    );
  }
}
