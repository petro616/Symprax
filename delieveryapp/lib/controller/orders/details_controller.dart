import 'package:DelieveryApp/core/class/status_request.dart';
import 'package:DelieveryApp/core/function/handlingdatacontroller.dart';
import 'package:DelieveryApp/data/model/order_details_model.dart';
import 'package:DelieveryApp/data/model/orders_model.dart';
import 'package:DelieveryApp/data/remote/orders/details_data.dart';

import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel ordersModel;
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  List<OrderDetailsModel> data = [];
  late StatusRequest statusRequest;
  @override
  void onInit() {
    ordersModel = Get.arguments["ordersmodel"];
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await orderDetailsData.getdata(ordersModel.ordersId!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response["data"];
        data.addAll(listdata.map((e) => OrderDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
