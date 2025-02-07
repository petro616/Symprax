import 'package:Symprax/controller/onboarding_controller.dart';
import 'package:Symprax/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSmoothPageOnBoarding extends StatelessWidget {
  const CustomSmoothPageOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(onboardinglist.length, (index) {
            return AnimatedContainer(
              margin: EdgeInsets.only(right: 5.w, left: 5.w),
              duration: const Duration(seconds: 1),
              height: controller.currentpage == index ? 12.h : 15.h,
              width: controller.currentpage == index ? 25.w : 15.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: const Color.fromARGB(255, 179, 69, 29)),
            );
          })
        ],
      );
    });
  }
}
