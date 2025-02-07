import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/data/datasource/remote/forgetpassword/verifycodeforpassword.dart';
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
        Get.defaultDialog(title: "145".tr, middleText: "146".tr);
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
