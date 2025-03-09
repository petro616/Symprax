import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:Symprax/controller/homescreen_controller.dart';
import 'package:Symprax/core/constant/colors.dart';
import 'package:Symprax/core/function/exitalert.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomescreenControllerimp());
    return GetBuilder<HomescreenControllerimp>(builder: (controller) {
      return Scaffold(
          backgroundColor: AppColor.colorscaffoldLogin,
          bottomNavigationBar: CurvedNavigationBar(
              height: 65,
              items: <Widget>[
                Icon(EvaIcons.home, size: 30.w),
                Icon(EvaIcons.heart, size: 30.w),
                Icon(EvaIcons.shoppingCart, size: 30.w),
                Icon(EvaIcons.bell, size: 30.w),
                Icon(EvaIcons.settings, size: 30.w),
              ],
              onTap: (index) {
                controller.changepage(index);
              },
              backgroundColor: Colors.grey),
          body: PopScope(
              canPop: false,
              onPopInvokedWithResult: ((didpop, result) {
                if (didpop) {
                  return;
                }
                exitaleratdialog();
              }),
              child: controller.listpage.elementAt(controller.currentpage)));
    });
  }
}
