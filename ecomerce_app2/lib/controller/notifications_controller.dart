import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/core/services/servisess.dart';
import 'package:Symprax/data/datasource/remote/notifications_data.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  NotificationsData notificationsData = NotificationsData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  MyServices myservices = Get.find();
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsData
        .getdata(myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
