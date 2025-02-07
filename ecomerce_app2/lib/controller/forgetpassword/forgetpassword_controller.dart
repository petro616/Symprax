import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetpasswordController extends GetxController {
  forgetPassword();
}

class ForgetpasswordControllerimp extends ForgetpasswordController {
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;
  CheckemailData checkemailData = CheckemailData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  forgetPassword() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkemailData.postData(email.text);
      statusRequest = handlingdata(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoute.verifycode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "147".tr, middleText: "148".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
