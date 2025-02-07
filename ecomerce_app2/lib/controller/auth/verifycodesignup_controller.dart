import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifycodesignupController extends GetxController {
  verifycodesignup();
  gotoSuccesSignUp(verifyCode);
}

class VerifycodesignupControllerimp extends VerifycodesignupController {
  Verifycodesignupdata verifycodesignupdata = Verifycodesignupdata(Get.find());

  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  verifycodesignup() {}

  @override
  gotoSuccesSignUp(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodesignupdata.postdata(email!, verifyCode);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoute.succesSignUp);
      } else {
        Get.defaultDialog(title: "145".tr, middleText: "146".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  reSend() {
    verifycodesignupdata.resendData(email!);
  }
}
