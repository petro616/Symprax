import 'package:Symprax/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Choosepaymentmethod extends StatelessWidget {
  final String title;
  final bool isactive;
  const Choosepaymentmethod(
      {super.key, required this.title, required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: Get.width.w,
      decoration: BoxDecoration(
          color: isactive == true ? AppColor.primarysecondcolor : Colors.white,
          borderRadius: BorderRadius.circular(50.r)),
      child: Container(
          margin: EdgeInsets.only(left: 10.w, top: 6.h),
          child: Text(
            title,
            style: TextStyle(
                color: isactive == true
                    ? Colors.white
                    : AppColor.primarysecondcolor,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp),
          )),
    );
  }
}
