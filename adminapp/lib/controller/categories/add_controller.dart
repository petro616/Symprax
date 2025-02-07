import 'dart:io';
import 'package:AdminApp/controller/categories/view_controller.dart';
import 'package:AdminApp/core/class/status_request.dart';
import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/core/function/upload_file.dart';
import 'package:AdminApp/data/remote/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/function/handlingdatacontroller.dart';

abstract class CategoriesAddController extends GetxController {
  add();
}

class CategoriesAddControllerimp extends CategoriesAddController {
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
  add() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Add Image");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {"name": name.text, "namear": namear.text};
      var response = await categoriesdata.addData(data, file!);
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
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}
