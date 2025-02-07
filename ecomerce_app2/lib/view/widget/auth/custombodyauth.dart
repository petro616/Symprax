import "package:Symprax/core/constant/colors.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class Custombodyauth extends StatelessWidget {
  final String text;
  const Custombodyauth({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      child: Text(
        text,
        style: TextStyle(
            color: AppColor.colorLoginTitleMain,
            fontSize: 13.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
