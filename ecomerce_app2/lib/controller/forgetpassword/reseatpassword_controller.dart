import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ReseatpasswordController extends GetxController {
  reseatPassword();
  gotoSuccesReseatPassword();
}

class ReseatpasswordControllerimp extends ReseatpasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());
  bool isShowPassword = true;
  showpassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  reseatPassword() {}

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  @override
  gotoSuccesReseatPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(title: "149".tr, middleText: "150".tr);
    }
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetpasswordData.postData(email!, password.text);
      statusRequest = handlingdata(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoute.succesReseatPassword);
        } else {
          Get.defaultDialog(title: "151".tr, middleText: "152".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
}
