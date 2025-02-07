import 'package:Symprax/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Chooseshippingaddress extends StatelessWidget {
  final String title;
  final String subtitle;
  final String phone;
  final bool isactive;
  const Chooseshippingaddress(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isactive,
      required this.phone});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(50.r, 50.r),
                topLeft: Radius.elliptical(50.r, 50.r))),
        color: isactive == true ? AppColor.primarysecondcolor : Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                title, //address.adressName!,
                style: TextStyle(
                    color: isactive == true
                        ? Colors.white
                        : AppColor.primarysecondcolor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "BebasNeue",
                    fontSize: 22.sp),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "${"106".tr}$subtitle",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: isactive == true
                        ? Colors.white
                        : AppColor.primarysecondcolor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "${"107".tr}$phone",
                style: TextStyle(
                    height: 2.h,
                    fontSize: 13.sp,
                    color: isactive == true
                        ? Colors.white
                        : AppColor.primarysecondcolor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}
/*
Card(
      elevation: 0.0,
      color: isactive == true ? AppColor.primarysecondcolor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isactive == true
                  ? Colors.white
                  : AppColor.primarysecondcolor),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isactive == true
                  ? Colors.white
                  : AppColor.primarysecondcolor),
        ),
      ),
    );
*/
