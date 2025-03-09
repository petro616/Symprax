import 'package:Symprax/core/services/servisess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LastTableRow extends StatelessWidget {
  final String title;
  const LastTableRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    MyServices myservices = Get.find();
    return myservices.sharedPreferences.getString("lang") == "en"
        ? Text(
            title,
            style: TextStyle(
                fontFamily: "BebasNeue",
                fontSize: 19.sp,
                color: Colors.blueGrey),
          )
        : Text(
            title,
            style: TextStyle(
                //fontFamily: "BebasNeue",
                fontSize: 15.sp,
                color: Colors.blueGrey),
          );
  }
}
