import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Custombuttomcoupon extends StatelessWidget {
  final void Function()? onPressed;
  const Custombuttomcoupon({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: Colors.blueGrey,
      onPressed: onPressed,
      child: Text(
        "79".tr,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
