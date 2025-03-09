import 'package:AdminApp/controller/orders/orderscreen_controller.dart';
import 'package:AdminApp/core/constant/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrderscreenControllerimp());
    return GetBuilder<OrderscreenControllerimp>(builder: (controller) {
      return Scaffold(
          backgroundColor: AppColor.colorscaffoldLogin,
          bottomNavigationBar: CurvedNavigationBar(
              height: 65,
              items: const <Widget>[
                Icon(Icons.pending, size: 30),
                Icon(Icons.check_circle, size: 30),
                Icon(EvaIcons.archive, size: 30),
              ],
              onTap: (index) {
                controller.changepage(index);
              },
              backgroundColor: Colors.grey),
          body: controller.listpage.elementAt(controller.currentpage));
    });
  }
}
