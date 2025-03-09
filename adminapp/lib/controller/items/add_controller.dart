import 'dart:io';
import 'package:AdminApp/controller/items/view_controller.dart';
import 'package:AdminApp/core/class/status_request.dart';
import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/core/function/upload_file.dart';
import 'package:AdminApp/data/model/categoriesmodel.dart';
import 'package:AdminApp/data/model/itemsmodel.dart';
import 'package:AdminApp/data/remote/categories_data.dart';
import 'package:AdminApp/data/remote/items_data.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/function/handlingdatacontroller.dart';

abstract class ItemsAddController extends GetxController {
  add();
}

class ItemsAddControllerimp extends ItemsAddController {
  File? file;
  File? file2;
  File? file3;
  List<File>? files;
  /*showOptionsImage() {
    showbuttonmenu(chooseImageFromCamera, choosefile);
  }*/

/*  chooseImageFromCamera() async {
    file = await uploadImageFromCamera();
    update();
  }*/

  choosefile() async {
    file = await uploadfileAnyThing();
    update();
  }

  choosesecondfile() async {
    file2 = await uploadfileAnyThing();
    update();
  }

  choosethirdfile() async {
    file3 = await uploadfileAnyThing();
    update();
  }

  /* choosemultifiles() async {
    files = await uploadmultifilesanything();
    update();
  }*/

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  GlobalKey<FormState> formstate2 = GlobalKey<FormState>();
  late TextEditingController dropdownnamecat;
  late TextEditingController itemsid;
  late TextEditingController dropdownid;
  late TextEditingController catname;
  late TextEditingController catid;
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  List<SelectedListItem> dropdownsearchlistcat = [];
  List<SelectedListItem> dropdownsearchlistitems = [];
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsdata = ItemsData(Get.find());
  @override
  add() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Add Image");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc": desc.text,
        "descar": descar.text,
        "price": price.text,
        "discount": discount.text,
        "count": count.text,
        "datenow": DateTime.now().toString(),
        "catid": "${catname.text[0]}${catname.text[1]}",
      };
      var response = await itemsdata.addData(data, file!);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoute.itemsaddmorephotos);
          //  ItemsViewControllerimp c = Get.find();
          //  c.view();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  addsecondphoto() async {
    if (formstate2.currentState!.validate()) {
      if (file2 == null) Get.snackbar("Warning", "Please Add Image");
      //  if (file3 == null) Get.snackbar("Warning", "Please Add Image");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "itemsid": "${itemsid.text[0]}${itemsid.text[1]}",
      };
      var response = await itemsdata.addsecondphoto(data, file2!);
      await itemsdata.addthirdphoto(data, file3!);
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

  getcategories() async {
    statusRequest = StatusRequest.loading;
    update();
    CategoriesData categoriesdata = CategoriesData(Get.find());
    var response = await categoriesdata.viewData();
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<CategoriesModel> data = [];
        List listdata = response["data"];
        data.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropdownsearchlistcat.addAll([
            SelectedListItem<String>(
                data: "${data[i].categoriesId} -> ${data[i].categoriesName}"),
          ]);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getitems() async {
    statusRequest = StatusRequest.loading;
    update();
    ItemsData itemsData = ItemsData(Get.find());
    var response = await itemsData.getIdFromItemsData();
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List<ItemsModel> data = [];
        List listdata = response["data"];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropdownsearchlistitems.addAll([
            SelectedListItem<String>(
                data: "${data[i].itemsId} -> ${data[i].itemsName}"),
          ]);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    dropdownnamecat = TextEditingController();
    itemsid = TextEditingController();
    dropdownid = TextEditingController();
    catname = TextEditingController();
    catid = TextEditingController();
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    getcategories();
    getitems();
    super.onInit();
  }
}
