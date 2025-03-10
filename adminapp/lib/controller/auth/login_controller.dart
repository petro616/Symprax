import 'package:AdminApp/core/class/status_request.dart';
import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/core/function/handlingdatacontroller.dart';
import 'package:AdminApp/core/services/servisess.dart';
import 'package:AdminApp/data/remote/auth/login.dart';
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
          if (response["data"]["admin_approve"] == "1") {
            myServices.sharedPreferences
                .setString("id", response["data"]["admin_id"]);
            // String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response["data"]["admin_name"]);
            myServices.sharedPreferences
                .setString("email", response["data"]["admin_email"]);
            myServices.sharedPreferences
                .setString("phone", response["data"]["admin_phone"]);
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("services");
            // FirebaseMessaging.instance.subscribeToTopic("users$userid");
            Get.offNamed(AppRoute.homePage);
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
