import 'package:DelieveryApp/controller/orders/pending_controller.dart';
import 'package:DelieveryApp/core/class/handlingdataview.dart';
import 'package:DelieveryApp/core/constant/colors.dart';
import 'package:DelieveryApp/view/widget/orders/cardlistorderss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pendings extends StatelessWidget {
  const Pendings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PendingController());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: Text("ORDERS"),
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
