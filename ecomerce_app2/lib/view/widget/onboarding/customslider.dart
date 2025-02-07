import 'package:Symprax/controller/onboarding_controller.dart';
import 'package:Symprax/core/constant/colors.dart';
import 'package:Symprax/data/datasource/static/static.dart';
import 'package:Symprax/view/widget/onboarding/custombutton.dart';
import 'package:Symprax/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomSliderOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onpagechanged(val);
      },
      itemCount: onboardinglist.length,
      itemBuilder: (context, i) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(100.r, 100.r)),
                child: Image.asset(
                  onboardinglist[i].image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 320.h,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                  decoration: BoxDecoration(
                      color: AppColor.colorContaineronboarding,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(100.r, 100.r))),
                  height: 435.h,
                  width: double.infinity.w,
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10.w, top: 10.h),
                          alignment: Alignment.topLeft,
                          child: Text(
                            onboardinglist[i].title!,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColor.colorTitleonboarding,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.sp,
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 10.w, top: 15.h),
                        alignment: Alignment.topLeft,
                        child: Text(
                          onboardinglist[i].body!,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColor.colorBodyonboarding,
                            fontWeight: FontWeight.w900,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      const CustomButtonOnBoarding(),
                      SizedBox(height: 15.h),
                      const CustomSmoothPageOnBoarding()
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }
}
