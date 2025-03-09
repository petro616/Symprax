import 'dart:io';
import 'package:AdminApp/controller/items/view_controller.dart';
import 'package:AdminApp/core/class/status_request.dart';
import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/core/function/upload_file.dart';
import 'package:AdminApp/data/model/itemsmodel.dart';
import 'package:AdminApp/data/remote/items_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/function/handlingdatacontroller.dart';

abstract class ItemsEditController extends GetxController {
  edit();
}

class ItemsEditControllerimp extends ItemsEditController {
  ItemsModel? itemsModel;
  File? file;
  choosefile() async {
    file = await uploadfileAnyThing();
    update();
  }

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController namear;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  @override
  edit() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "imageold": itemsModel!.itemsImage,
        "id": itemsModel!.itemsId.toString()
      };
      var response = await itemsData.editData(data, file);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoute.itemsview);
          ItemsViewControllerimp c = Get.find();
          c.view();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    itemsModel = Get.arguments["itemsmodel"];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;
    super.onInit();
  }
}
