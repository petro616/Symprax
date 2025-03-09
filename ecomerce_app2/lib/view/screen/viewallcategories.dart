import 'package:Symprax/controller/categories_controller.dart';
import 'package:Symprax/core/class/handlingdataview.dart';
import 'package:Symprax/core/constant/colors.dart';
import 'package:Symprax/view/widget/home/custom_viewallcategories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Viewallcategories extends StatelessWidget {
  const Viewallcategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CategoriesControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("70".tr),
      ),
      backgroundColor: AppColor.colorscaffoldLogin,
      body: GetBuilder<CategoriesControllerImp>(builder: (controller) {
        return Container(
          margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Handlingdataview(
                  statusRequest: controller.statusRequest,
                  widget: const CustomViewallcategories())
            ],
          ),
        );
      }),
    );
  }
}
