import 'package:Symprax/core/services/servisess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomNameproduct extends StatelessWidget {
  final String text;
  const CustomNameproduct({super.key, required this.text});

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
                  color: Colors.blueGrey,
                  fontSize: 27.sp,
                  fontFamily: "BebasNeue",
                  fontWeight: FontWeight.bold),
            ),
          )
        : Container(
            padding: EdgeInsets.only(right: 57.w),
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
          );
  }
}
