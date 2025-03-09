import 'package:DelieveryApp/core/class/status_request.dart';
import 'package:DelieveryApp/core/function/handlingdatacontroller.dart';
import 'package:DelieveryApp/core/services/servisess.dart';
import 'package:DelieveryApp/data/model/orders_model.dart';
import 'package:DelieveryApp/data/remote/orders/pending_data.dart';
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
    var response = await pendingData.getdata();
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

  refreshorder() {
    getorders();
  }

  approveorders(String ordersid, String usersid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingData.approvedata(
        ordersid, usersid, myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        getorders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getorders();
    super.onInit();
  }
}
