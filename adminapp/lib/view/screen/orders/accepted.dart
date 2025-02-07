import 'package:AdminApp/controller/orders/accepted_controller.dart';
import 'package:AdminApp/core/class/handlingdataview.dart';
import 'package:AdminApp/core/constant/colors.dart';
import 'package:AdminApp/view/widget/orders/cardorders_accepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Accepted extends StatelessWidget {
  const Accepted({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AcceptedController());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: Text("ACCEPTED ORDERS"),
        ),
        body: GetBuilder<AcceptedController>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) {
                    return CardordersAccepted(ordersModel: controller.data[i]);
                  }));
        }));
  }
}
