import 'dart:io';
import 'package:AdminApp/controller/categories/view_controller.dart';
import 'package:AdminApp/core/class/status_request.dart';
import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/core/function/upload_file.dart';
import 'package:AdminApp/data/model/categoriesmodel.dart';
import 'package:AdminApp/data/remote/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/function/handlingdatacontroller.dart';

abstract class CategoriesEditController extends GetxController {
  edit();
}

class CategoriesEditControllerimp extends CategoriesEditController {
  CategoriesModel? categoriesModel;
  File? file;
  choosefile() async {
    file = await uploadfileAnyThing();
    update();
  }

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController namear;
  StatusRequest statusRequest = StatusRequest.none;
  CategoriesData categoriesdata = CategoriesData(Get.find());
  @override
  edit() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "imageold": categoriesModel!.categoriesImage,
        "id": categoriesModel!.categoriesId.toString()
      };
      var response = await categoriesdata.editData(data, file);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoute.categoriesview);
          CategoriesViewControllerimp c = Get.find();
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
    categoriesModel = Get.arguments["categorymodel"];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categoriesModel!.categoriesName!;
    namear.text = categoriesModel!.categoriesNameAr!;
    super.onInit();
  }
}
