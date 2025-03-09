import 'package:Symprax/core/services/servisess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomPrice extends StatelessWidget {
  final String price;
  const CustomPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    MyServices myservices = Get.find();
    return myservices.sharedPreferences.getString("lang") == "en"
        ? Container(
            padding: EdgeInsets.only(left: 5.w, top: 8.h),
            alignment: Alignment.centerLeft,
            child: Text(
              "PRICE : $price S.Y.P",
              style: TextStyle(
                  fontFamily: "BebasNeue",
                  color: Color.fromARGB(255, 51, 94, 116),
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
          )
        : Container(
            padding: EdgeInsets.only(right: 10.w, top: 8.h),
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    "السعر : ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 51, 94, 116),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "$price S.Y.P",
                  style: TextStyle(
                      fontFamily: "BebasNeue",
                      color: Color.fromARGB(255, 51, 94, 116),
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ));
  }
}
