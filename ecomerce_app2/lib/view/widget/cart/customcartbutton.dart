import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Customcartbutton extends StatelessWidget {
  final void Function() onPressed;
  const Customcartbutton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MaterialButton(
        minWidth: Get.width / 2.w,
        color: Colors.blueGrey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(100.r, 100.r),
                bottomRight: Radius.elliptical(100.r, 100.r))),
        onPressed: onPressed,
        child: Text(
          "85".tr,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
