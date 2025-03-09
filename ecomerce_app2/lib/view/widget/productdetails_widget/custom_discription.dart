import 'package:Symprax/core/services/servisess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDiscription extends StatelessWidget {
  final String text;
  const CustomDiscription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    MyServices myservices = Get.find();
    return myservices.sharedPreferences.getString("lang") == "en"
        ? Container(
            padding: EdgeInsets.only(left: 5.w),
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: "srs",
                  color: Colors.grey[500],
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold),
            ),
          )
        : Container(
            padding: EdgeInsets.only(right: 30.w, top: 5.h),
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          );
  }
}
