import 'package:Symprax/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Choosedeliverytype extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isactive;
  const Choosedeliverytype(
      {super.key,
      required this.title,
      required this.icon,
      required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: isactive == true ? AppColor.primarysecondcolor : Colors.white,
      ),
      height: 155.h,
      width: 155.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 100.w,
            color:
                isactive == true ? Colors.white : AppColor.primarysecondcolor,
          ),
          Text(
            title,
            style: TextStyle(
                color: isactive == true
                    ? Colors.white
                    : AppColor.primarysecondcolor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
