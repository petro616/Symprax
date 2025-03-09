import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressDeleteButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const AddressDeleteButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      alignment: Alignment.bottomRight,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(50.r, 50.r),
                topLeft: Radius.elliptical(50.r, 50.r))),
        color: Colors.white,
        textColor: Colors.grey,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "BebasNeue",
          ),
        ),
      ),
    );
  }
}
