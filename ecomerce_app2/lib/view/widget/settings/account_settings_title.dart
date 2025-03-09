import 'package:Symprax/core/services/servisess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountSettingsTitle extends StatelessWidget {
  const AccountSettingsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myservices = Get.find();
    return myservices.sharedPreferences.getString("lang") == "en"
        ? Container(
            margin: EdgeInsets.only(left: 15.w, top: 5.h),
            alignment: Alignment.centerLeft,
            child: Text(
              "98".tr,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            ),
          )
        : Container(
            margin: EdgeInsets.only(right: 15.w, top: 5.h),
            alignment: Alignment.centerRight,
            child: Text(
              "98".tr,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp),
            ),
          );
  }
}
