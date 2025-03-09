import "package:Symprax/controller/forgetpassword/forgetpassword_controller.dart";
import "package:Symprax/core/class/handlingdataview.dart";
import "package:Symprax/core/constant/colors.dart";
import "package:Symprax/core/function/validinput.dart";
import "package:Symprax/view/widget/auth/custombodyauth.dart";
import "package:Symprax/view/widget/auth/custombuttonauth.dart";
import "package:Symprax/view/widget/auth/customtextform.dart";
import "package:Symprax/view/widget/auth/customtitleauth.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class Forgetpassowrd extends StatelessWidget {
  const Forgetpassowrd({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ForgetpasswordControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 194, 133),
          title: Text(
            "27".tr,
            style: TextStyle(
                color: AppColor.colorLoginTitleMain,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp),
          ),
        ),
        body: GetBuilder<ForgetpasswordControllerimp>(builder: (controller) {
          return Handlingdatarequest(
              statusRequest: controller.statusRequest,
              widget: SingleChildScrollView(
                child: Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      Customtitleauth(
                        text: "28".tr,
                      ),
                      Custombodyauth(text: "29".tr),
                      SizedBox(height: 70.h),
                      Customtextform(
                        keyboardTypeform: TextInputType.emailAddress,
                        validatores: (val) {
                          return validinput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        hint: "31".tr,
                        label: "30".tr,
                        icon: EvaIcons.email,
                      ),
                      SizedBox(height: 40.h),
                      Custombuttonauth(
                        text: "32".tr,
                        onPressed: () {
                          controller.forgetPassword();
                        },
                      ),
                    ],
                  ),
                ),
              ));
        }));
  }
}
