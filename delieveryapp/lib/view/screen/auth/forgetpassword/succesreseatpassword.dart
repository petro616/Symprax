import "package:DelieveryApp/controller/auth/succesreseatpassword_controller.dart";
import "package:DelieveryApp/core/constant/colors.dart";
import "package:DelieveryApp/view/widget/auth/custombodyauth.dart";
import "package:DelieveryApp/view/widget/auth/custombuttonauth.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class Succesreseatpassword extends StatelessWidget {
  const Succesreseatpassword({super.key});
  @override
  Widget build(BuildContext context) {
    SuccesreseatpasswordControllerimp controller =
        Get.put(SuccesreseatpasswordControllerimp());
    return Scaffold(
      backgroundColor: AppColor.colorscaffoldLogin,
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 220.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                      color: AppColor.colorLoginTitleMain,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(112.r, 112.r),
                          bottomLeft: Radius.elliptical(112.r, 112.r))),
                  margin: EdgeInsets.only(top: 90.h),
                  child: Icon(
                    Icons.check_circle,
                    size: 130.w,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "44".tr,
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              Custombodyauth(text: "45".tr),
              Container(
                margin: EdgeInsets.only(top: 145.h),
                child: Custombuttonauth(
                  text: "46".tr,
                  onPressed: () {
                    controller.goToLogin();
                  },
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
