import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Firstbackgroundcolortitle extends StatelessWidget {
  final String title;
  final IconData icon;
  const Firstbackgroundcolortitle(
      {super.key, required this.title, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      child: Row(
        children: [
          Text(
            "$title ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.sp,
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5.h,
            ),
            child: Icon(
              icon,
              size: 35.w,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
