import 'package:Symprax/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomButtonOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      child: MaterialButton(
        minWidth: 200.w,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
        color: const Color.fromARGB(255, 233, 153, 33),
        textColor: const Color.fromARGB(255, 149, 42, 3),
        onPressed: () {
          controller.next();
        },
        child: Text(
          "Continue",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
