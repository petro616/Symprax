import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/data/datasource/remote/orders/details_data.dart';
import 'package:Symprax/data/model/orderdetailsmodel.dart';
import 'package:Symprax/data/model/ordersmodel.dart';
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
