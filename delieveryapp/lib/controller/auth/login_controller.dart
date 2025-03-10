import 'package:DelieveryApp/core/class/status_request.dart';
import 'package:DelieveryApp/core/constant/routes.dart';
import 'package:DelieveryApp/core/function/handlingdatacontroller.dart';
import 'package:DelieveryApp/core/services/servisess.dart';
import 'package:DelieveryApp/data/remote/auth/login.dart';
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
          if (response["data"]["delieveryapp_approve"] == "1") {
            myServices.sharedPreferences
                .setString("id", response["data"]["delieveryapp_id"]);
            myServices.sharedPreferences
                .setString("username", response["data"]["delieveryapp_name"]);
            myServices.sharedPreferences
                .setString("email", response["data"]["delieveryapp_email"]);
            myServices.sharedPreferences
                .setString("phone", response["data"]["delieveryapp_phone"]);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("delievery");
            FirebaseMessaging.instance.subscribeToTopic("Delievery");

            Get.offNamed(AppRoute.homescreen);
          } else {
            Get.toNamed(AppRoute.verifycodesignup,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "WARNING",
              middleText: "YOUR EMAIL OR YOUR PASSWORD OS NOT CORRECT");
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
    /*   FirebaseMessaging.instance.getToken().then((value) {
      //print(value);
      String? token = value;
    });*/
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
