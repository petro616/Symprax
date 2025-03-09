import "package:Symprax/core/services/servisess.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class CustomButtonGotoViewallOffers extends StatelessWidget {
  const CustomButtonGotoViewallOffers({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myservices = Get.find();
    return myservices.sharedPreferences.getString("lang") == "en"
        ? Row(
            children: [
              Text(
                "63".tr,
                style: TextStyle(
                    height: 1.5.h,
                    fontFamily: "BebasNeue",
                    fontSize: 18.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.sell,
                color: Colors.black,
              ),
            ],
          )
        : Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 3.h),
                child: Text(
                  "63".tr,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Icons.sell,
                color: Colors.red,
              ),
            ],
          );
  }
}
