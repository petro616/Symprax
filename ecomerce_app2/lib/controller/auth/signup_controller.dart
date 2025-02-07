import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  signup();
  goToPageLogin();
}

class SignupControllerimp extends SignupController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());
  List data = [];
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isshowpassword = false;
  showpassord() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  signup() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(
          username.text, email.text, password.text, phone.text);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoute.verifycodesignup,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "143".tr, middleText: "144".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
