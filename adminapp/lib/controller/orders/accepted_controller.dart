import 'package:AdminApp/core/class/status_request.dart';
import 'package:AdminApp/core/function/handlingdatacontroller.dart';
import 'package:AdminApp/core/services/servisess.dart';
import 'package:AdminApp/data/model/orders_model.dart';
import 'package:AdminApp/data/remote/orders/accepted_data.dart';
import 'package:get/get.dart';

class AcceptedController extends GetxController {
  AcceptedData acceptedData = AcceptedData(Get.find());
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
    var response = await acceptedData.getdata();
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

  donePrepareOrders(String ordersid, String usersid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await acceptedData.doneprepareData(ordersid, usersid);
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

  refreshorder() {
    getorders();
  }

  @override
  void onInit() {
    getorders();
    super.onInit();
  }
}
