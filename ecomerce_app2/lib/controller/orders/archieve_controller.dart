import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/core/services/servisess.dart';
import 'package:Symprax/data/datasource/remote/orders/archive_data.dart';
import 'package:Symprax/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class ArchieveController extends GetxController {
  ArchiveData archiveData = ArchiveData(Get.find());
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
      return "Order is picked by delivery man";
    } else if (val == "3") {
      return "On My Way To You";
    } else {
      return "Archieve";
    }
  }

  getorders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveData
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

  refreshorder() {
    getorders();
  }

  submitRating(String ordersid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await archiveData.ratingdata(ordersid, rating.toString(), comment);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        getorders();
      } else {
        statusRequest = StatusRequest.none;
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
