import "package:Symprax/controller/auth/signup_controller.dart";
import "package:Symprax/core/class/handlingdataview.dart";
import "package:Symprax/core/constant/colors.dart";
import "package:Symprax/core/function/exitalert.dart";
import "package:Symprax/core/function/validinput.dart";
import "package:Symprax/view/widget/auth/custombodyauth.dart";
import "package:Symprax/view/widget/auth/custombuttonauth.dart";
import "package:Symprax/view/widget/auth/customchangestart.dart";
import "package:Symprax/view/widget/auth/customtextform.dart";
import "package:Symprax/view/widget/auth/customtitleauth.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class Signup extends StatelessWidget {
  const Signup({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignupControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 194, 133),
          title: Text(
            "13".tr,
            style: TextStyle(
                color: AppColor.colorLoginTitleMain,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp),
          ),
        ),
        body: PopScope(
            canPop: false,
            onPopInvokedWithResult: ((didpop, result) {
              if (didpop) {
                return;
              }
              exitaleratdialog();
            }),
            child: GetBuilder<SignupControllerimp>(builder: (controller) {
              return Handlingdatarequest(
                  statusRequest: controller.statusRequest,
                  widget: SingleChildScrollView(
                    child: Form(
                      key: controller.formState,
                      child: Column(
                        children: [
                          Customtitleauth(
                            text: "14".tr,
                          ),
                          Custombodyauth(text: "15".tr),
                          SizedBox(height: 60.h),
                          Customtextform(
                            keyboardTypeform: TextInputType.text,
                            validatores: (val) {
                              return validinput(val!, 5, 100, "username");
                            },
                            mycontroller: controller.username,
                            hint: "17".tr,
                            label: "16".tr,
                            icon: Icons.person_4_outlined,
                          ),
                          SizedBox(height: 32.h),
                          Customtextform(
                            keyboardTypeform: TextInputType.emailAddress,
                            validatores: (val) {
                              return validinput(val!, 5, 100, "email");
                            },
                            mycontroller: controller.email,
                            hint: "19".tr,
                            label: "18".tr,
                            icon: EvaIcons.email,
                          ),
                          SizedBox(height: 32.h),
                          GetBuilder<SignupControllerimp>(
                              builder: (controller) {
                            return Customtextform(
                              obscuretype: controller.isshowpassword,
                              onTap: () {
                                controller.showpassord();
                              },
                              keyboardTypeform: TextInputType.text,
                              validatores: (val) {
                                return validinput(val!, 5, 100, "password");
                              },
                              mycontroller: controller.password,
                              hint: "21".tr,
                              label: "20".tr,
                              icon: controller.isshowpassword == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            );
                          }),
                          SizedBox(height: 32.h),
                          Customtextform(
                            keyboardTypeform: TextInputType.phone,
                            validatores: (val) {
                              return validinput(val!, 5, 100, "phone");
                            },
                            mycontroller: controller.phone,
                            hint: "23".tr,
                            label: "22".tr,
                            icon: Icons.phone,
                          ),
                          SizedBox(height: 40.h),
                          Custombuttonauth(
                            text: "24".tr,
                            onPressed: () {
                              controller.signup();
                            },
                          ),
                          SizedBox(height: 50.h),
                          Customchangestart(
                            text1: "26".tr,
                            text2: "25".tr,
                            onTap: () {
                              controller.goToPageLogin();
                            },
                          ),
                        ],
                      ),
                    ),
                  ));
            })));
  }
}
