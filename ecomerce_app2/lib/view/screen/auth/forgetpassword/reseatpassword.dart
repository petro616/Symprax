import "package:Symprax/controller/forgetpassword/reseatpassword_controller.dart";
import "package:Symprax/core/class/handlingdataview.dart";
import "package:Symprax/core/constant/colors.dart";
import "package:Symprax/core/function/validinput.dart";
import "package:Symprax/view/widget/auth/custombodyauth.dart";
import "package:Symprax/view/widget/auth/custombuttonauth.dart";
import "package:Symprax/view/widget/auth/customtextform.dart";
import "package:Symprax/view/widget/auth/customtitleauth.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class Reseatpassword extends StatelessWidget {
  const Reseatpassword({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ReseatpasswordControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 194, 133),
          title: Text(
            "36".tr,
            style: TextStyle(
                color: AppColor.colorLoginTitleMain,
                fontWeight: FontWeight.bold,
                fontSize: 26.sp),
          ),
        ),
        body: GetBuilder<ReseatpasswordControllerimp>(builder: (controller) {
          return Handlingdatarequest(
              statusRequest: controller.statusRequest,
              widget: SingleChildScrollView(
                child: Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      Customtitleauth(
                        text: "37".tr,
                      ),
                      Custombodyauth(text: "38".tr),
                      SizedBox(height: 70.h),
                      Customtextform(
                        obscuretype: controller.isShowPassword,
                        onTap: () {
                          controller.showpassword();
                        },
                        keyboardTypeform: TextInputType.text,
                        validatores: (val) {
                          return validinput(val!, 5, 100, "password");
                        },
                        mycontroller: controller.password,
                        hint: "40".tr,
                        label: "39".tr,
                        icon: controller.isShowPassword == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      SizedBox(height: 32.h),
                      Customtextform(
                        obscuretype: controller.isShowPassword,
                        onTap: () {
                          controller.showpassword();
                        },
                        keyboardTypeform: TextInputType.text,
                        validatores: (val) {
                          return validinput(val!, 5, 100, "password");
                        },
                        mycontroller: controller.repassword,
                        hint: "42".tr,
                        label: "41".tr,
                        icon: controller.isShowPassword == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      SizedBox(height: 40.h),
                      Custombuttonauth(
                        text: "43".tr,
                        onPressed: () {
                          controller.gotoSuccesReseatPassword();
                        },
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ));
        }));
  }
}
