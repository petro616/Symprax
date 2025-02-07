import 'package:Symprax/controller/orders/archieve_controller.dart';
import 'package:Symprax/core/class/handlingdataview.dart';
import 'package:Symprax/core/constant/colors.dart';
import 'package:Symprax/view/widget/orders/cardlistorders_archive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Archieve extends StatelessWidget {
  const Archieve({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchieveController());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: Text("140".tr),
        ),
        body: GetBuilder<ArchieveController>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) {
                    return CardlistordersArchive(
                        ordersModel: controller.data[i]);
                  }));
        }));
  }
}
