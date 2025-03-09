import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/core/services/servisess.dart';
import 'package:Symprax/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToPageSignUp();
  gotoforgetpassword();
}

class LoginControllerimp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowPassword = true;
  showpassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingdata(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          if (response["data"]["user_approve"] == "1") {
            myServices.sharedPreferences
                .setString("id", response["data"]["user_id"]);
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response["data"]["user_name"]);
            myServices.sharedPreferences
                .setString("email", response["data"]["user_email"]);
            myServices.sharedPreferences
                .setString("phone", response["data"]["user_phone"]);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users$userid");
            Get.offNamed(AppRoute.homescreen);
          } else {
            Get.toNamed(AppRoute.verifycodesignup,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(title: "142".tr, middleText: "141".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToPageSignUp() {
    Get.offAllNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      //print(value);
      // ignore: unused_local_variable
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  gotoforgetpassword() {
    Get.toNamed(AppRoute.forgetpassowrd);
  }
}
