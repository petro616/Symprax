import 'package:AdminApp/core/class/status_request.dart';
import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/core/function/handlingdatacontroller.dart';
import 'package:AdminApp/data/remote/forgetpassword/verifycodeforpassword.dart';
import 'package:get/get.dart';

abstract class VerifycodepasswordController extends GetxController {
  verifycodePassword();
  gotoReseatPassword(verifycode);
}

class VerifycodepasswordControllerimp extends VerifycodepasswordController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifycodeforpasswordData verifycodeforpasswordData =
      VerifycodeforpasswordData(Get.find());
  @override
  verifycodePassword() {}

  @override
  gotoReseatPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodeforpasswordData.postData(email!, verifycode);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoute.reseatPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "WARNING", middleText: "YOUR CODE IS NOT CORRECT ");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
