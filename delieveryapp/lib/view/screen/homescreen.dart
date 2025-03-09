import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:DelieveryApp/controller/homescreen_controller.dart';
import 'package:DelieveryApp/core/constant/colors.dart';
import 'package:DelieveryApp/core/function/exitalert.dart';
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
                Icon(Icons.pending, size: 30.w),
                Icon(Icons.check_circle, size: 30.w),
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
