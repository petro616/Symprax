import "package:DelieveryApp/core/constant/colors.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class Customtitleauth extends StatelessWidget {
  final String text;
  const Customtitleauth({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      child: Text(
        text,
        style: TextStyle(
            color: AppColor.colorLoginTitleSub,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
