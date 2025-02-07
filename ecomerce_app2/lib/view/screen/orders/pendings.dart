import 'package:Symprax/controller/orders/pending_controller.dart';
import 'package:Symprax/core/class/handlingdataview.dart';
import 'package:Symprax/core/constant/colors.dart';
import 'package:Symprax/view/widget/orders/cardlistorderss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pendings extends StatelessWidget {
  const Pendings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingController());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: Text("124".tr),
        ),
        body: GetBuilder<PendingController>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) {
                    return Cardlistorders(ordersModel: controller.data[i]);
                  }));
        }));
  }
}
