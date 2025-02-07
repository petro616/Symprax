import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/core/services/servisess.dart';
import 'package:Symprax/data/datasource/remote/orders/pending_data.dart';
import 'package:Symprax/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class PendingController extends GetxController {
  PendingData pendingData = PendingData(Get.find());
  MyServices myservices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersModel> data = [];

  String printOrderType(String val) {
    if (val == "0") {
      return "Delievery";
    } else {
      return "Recieve";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delievery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Wait Order Approve";
    } else if (val == "1") {
      return "Preparing Order";
    } else if (val == "2") {
      return "On My Way To You";
    } else {
      return "Archieve";
    }
  }

  getorders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData
        .getdata(myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response["data"];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteorders(String ordersid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData.deletedata(ordersid);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        refreshorder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshorder() {
    getorders();
  }

  @override
  void onInit() {
    getorders();
    super.onInit();
  }
}
