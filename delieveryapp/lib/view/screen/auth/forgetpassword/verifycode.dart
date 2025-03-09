import "package:DelieveryApp/controller/forgetpassword/verifycodereseatpassword_controller.dart";
import "package:DelieveryApp/core/class/handlingdataview.dart";
import "package:DelieveryApp/core/constant/colors.dart";
import "package:DelieveryApp/view/widget/auth/custombodyauth.dart";
import "package:DelieveryApp/view/widget/auth/customtitleauth.dart";
import "package:flutter/material.dart";
import "package:flutter_otp_text_field/flutter_otp_text_field.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class Verifycode extends StatelessWidget {
  const Verifycode({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifycodepasswordControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 194, 133),
          title: Text(
            "33".tr,
            style: TextStyle(
                color: AppColor.colorLoginTitleMain,
                fontWeight: FontWeight.bold,
                fontSize: 26.sp),
          ),
        ),
        body:
            GetBuilder<VerifycodepasswordControllerimp>(builder: (controller) {
          return Handlingdatarequest(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  Customtitleauth(
                    text: "34".tr,
                  ),
                  Custombodyauth(text: "35".tr),
                  SizedBox(height: 90.h),
                  OtpTextField(
                    cursorColor: AppColor.colorLoginTitleMain,
                    enabledBorderColor: AppColor.colorLoginTitleSub,
                    focusedBorderColor: AppColor.colorLoginTitleSub,
                    fieldWidth: 50.0.w,
                    numberOfFields: 5,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.gotoReseatPassword(verificationCode);
                    }, // end onSubmit
                  ),
                ],
              ));
        }));
  }
}
