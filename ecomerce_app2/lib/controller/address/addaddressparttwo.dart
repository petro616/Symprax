import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/core/function/handlingdatacontroller.dart';
import 'package:Symprax/core/services/servisess.dart';
import 'package:Symprax/data/datasource/remote/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addaddressparttwocontroller extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String? lat;
  String? long;
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController phone;
  StatusRequest statusRequest = StatusRequest.none;
  AddressData testData = AddressData(Get.find());
  List data = [];
  MyServices myservices = Get.find();
  addaddress() async {
    if (formstate.currentState!.validate()) {
      data.clear();
      statusRequest = StatusRequest.loading;
      update();
      var response = await testData.adddata(
          myservices.sharedPreferences.getString("id")!,
          name.text,
          city.text,
          phone.text,
          street.text,
          lat!,
          long!);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        Get.offAllNamed(AppRoute.homescreen);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  initialdata() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    phone = TextEditingController();
    lat = Get.arguments["lat"];
    long = Get.arguments["long"];
  }

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    city.dispose();
    street.dispose();
    phone.dispose();
    super.dispose();
  }
}
