import 'package:AdminApp/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonAddOrEditItems extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const ButtonAddOrEditItems(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w),
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
        minWidth: 100.w,
        color: Colors.white,
        textColor: AppColor.colorOnBoardingButton,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
