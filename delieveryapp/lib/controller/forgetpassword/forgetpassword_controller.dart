import 'package:DelieveryApp/core/class/status_request.dart';
import 'package:DelieveryApp/core/constant/routes.dart';
import 'package:DelieveryApp/core/function/handlingdatacontroller.dart';
import 'package:DelieveryApp/data/remote/forgetpassword/checkemail.dart';
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
          Get.defaultDialog(
              title: "WARNING", middleText: "YOUR EMAIL IS NOT FOUND");
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
