import "package:AdminApp/controller/auth/login_controller.dart";
import "package:AdminApp/core/class/handlingdataview.dart";
import "package:AdminApp/core/constant/colors.dart";
import "package:AdminApp/core/function/exitalert.dart";
import "package:AdminApp/core/function/validinput.dart";
import "package:AdminApp/view/widget/auth/custombodyauth.dart";
import "package:AdminApp/view/widget/auth/custombuttonauth.dart";
import "package:AdminApp/view/widget/auth/customchangestart.dart";
import "package:AdminApp/view/widget/auth/customimageauth.dart";
import "package:AdminApp/view/widget/auth/customtextform.dart";
import "package:AdminApp/view/widget/auth/customtitleauth.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 194, 133),
          title: Text(
            "2".tr,
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
            child: GetBuilder<LoginControllerimp>(builder: (controller) {
              return Handlingdatarequest(
                  statusRequest: controller.statusRequest,
                  widget: SingleChildScrollView(
                    child: Form(
                      key: controller.formState,
                      child: Column(
                        children: [
                          const Customimageauth(),
                          Customtitleauth(
                            text: "3".tr,
                          ),
                          Custombodyauth(
                            text: "4".tr,
                          ),
                          SizedBox(height: 70.h),
                          Customtextform(
                            keyboardTypeform: TextInputType.emailAddress,
                            validatores: (val) {
                              return validinput(val!, 5, 100, "email");
                            },
                            mycontroller: controller.email,
                            hint: "6".tr,
                            label: "5".tr,
                            icon: EvaIcons.email,
                          ),
                          SizedBox(height: 32.h),
                          Customtextform(
                            onTap: () {
                              controller.showpassword();
                            },
                            obscuretype: controller.isShowPassword,
                            keyboardTypeform: TextInputType.text,
                            validatores: (val) {
                              return validinput(val!, 5, 100, "password");
                            },
                            mycontroller: controller.password,
                            hint: "8".tr,
                            label: "7".tr,
                            icon: controller.isShowPassword == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 25.w, top: 7.h),
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                controller.gotoforgetpassword();
                              },
                              child: Text(
                                "9".tr,
                                style: TextStyle(
                                    color: AppColor.colorLoginTitleSub,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: 50.h),
                          Custombuttonauth(
                            text: "10".tr,
                            onPressed: () {
                              controller.login();
                            },
                          ),
                          SizedBox(height: 50.h),
                          Customchangestart(
                            text1: "11".tr,
                            text2: "12".tr,
                            onTap: () {
                              controller.goToPageSignUp();
                            },
                          ),
                        ],
                      ),
                    ),
                  ));
            })));
  }
}
