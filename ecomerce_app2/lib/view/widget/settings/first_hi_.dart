import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FirstHey extends StatelessWidget {
  const FirstHey({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.w, top: 5.h),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.r)),
            padding: EdgeInsets.all(5.w),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage: AssetImage(
                  "assets/images/—Pngtree—businessman user avatar wearing suit_8385663.png"),
              radius: 35.r,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15.w),
              child: Text(
                "97".tr,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp),
              ))
        ],
      ),
    );
  }
}
