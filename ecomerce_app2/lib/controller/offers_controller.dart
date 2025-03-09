import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/core/services/servisess.dart';
import 'package:Symprax/data/datasource/remote/offers_data.dart';
import 'package:Symprax/data/model/itemsmodel.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];
  late StatusRequest statusRequest;
  MyServices myservices = Get.find();
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getdata();
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdataoffers = response["data"];
        data.addAll(listdataoffers.map((e) => ItemsModel.fromJson(e)));
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

  gotoproductdetails(itemsmodel) {
    Get.toNamed(AppRoute.productdetails, arguments: {
      "itemsmodel": itemsmodel,
    });
  }
}
