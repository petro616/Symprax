import "package:Symprax/core/services/servisess.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class Customundercategoriestitle extends StatelessWidget {
  final String title;
  const Customundercategoriestitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    MyServices myservices = Get.find();
    return myservices.sharedPreferences.getString("lang") == "en"
        ? Container(
            margin: EdgeInsets.only(
              top: 8.h,
              bottom: 6.h,
            ),
            child: Text(
              title,
              style: TextStyle(
                height: 1,
                fontFamily: "BebasNeue",
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(
              top: 6.h,
              bottom: 7.h,
            ),
            child: Text(
              title,
              style: TextStyle(
                height: 1.h,
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: 17.5.sp,
              ),
            ));
  }
}
