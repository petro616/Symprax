import 'package:AdminApp/controller/home_page_controller.dart';
import 'package:AdminApp/core/constant/colors.dart';
import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/view/widget/home/card_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return Scaffold(
      backgroundColor: AppColor.colorscaffoldLogin,
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: ListView(
        children: [
          GridView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: 115.h),
            children: [
              CardHome(
                  url: "assets/images/photo_2025-01-23_09-47-29.jpg",
                  title: "Categories",
                  onclick: () {
                    Get.toNamed(AppRoute.categoriesview);
                  }),
              CardHome(
                  url: "assets/images/photo_2025-01-23_09-47-27.jpg",
                  title: "Products",
                  onclick: () {
                    Get.toNamed(AppRoute.itemsview);
                  }),
              CardHome(
                  url: "assets/images/photo_2025-01-23_09-47-25.jpg",
                  title: "Orders",
                  onclick: () {
                    Get.toNamed(AppRoute.orderscreen);
                  }),
            ],
          )
        ],
      ),
    );
  }
}
