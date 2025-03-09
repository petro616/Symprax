import "package:Symprax/controller/auth/verifycodesignup_controller.dart";
import "package:Symprax/core/class/handlingdataview.dart";
import "package:Symprax/core/constant/colors.dart";
import "package:Symprax/view/widget/auth/custombodyauth.dart";
import "package:Symprax/view/widget/auth/customtitleauth.dart";
import "package:flutter/material.dart";
import "package:flutter_otp_text_field/flutter_otp_text_field.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class Verifycodesignup extends StatelessWidget {
  const Verifycodesignup({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifycodesignupControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 194, 133),
          title: Text(
            "47".tr,
            style: TextStyle(
                color: AppColor.colorLoginTitleMain,
                fontWeight: FontWeight.bold,
                fontSize: 26.sp),
          ),
        ),
        body: GetBuilder<VerifycodesignupControllerimp>(builder: (controller) {
          return Handlingdatarequest(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  Customtitleauth(
                    text: "48".tr,
                  ),
                  Custombodyauth(text: "49".tr),
                  SizedBox(height: 80.h),
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
                      controller.gotoSuccesSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                  SizedBox(height: 30.h),
                  MaterialButton(
                    color: AppColor.colorLoginTitleMain,
                    textColor: Colors.white,
                    onPressed: () {
                      controller.reSend();
                    },
                    child: Text(
                      "50".tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ));
        }));
  }
}
