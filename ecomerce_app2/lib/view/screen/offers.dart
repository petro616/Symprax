import 'package:Symprax/controller/offers_controller.dart';
import 'package:Symprax/core/class/handlingdataview.dart';
import 'package:Symprax/core/constant/colors.dart';
import 'package:Symprax/view/widget/offers/custom_offers_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    return Scaffold(
      backgroundColor: AppColor.colorscaffoldLogin,
      appBar: AppBar(
        title: Text("71".tr),
      ),
      body: GetBuilder<OffersController>(builder: (controller) {
        return Handlingdataview(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(5.w),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 150.h),
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) {
                    return CustomitemsoffersCard(
                        itemsModel: controller.data[i]);
                  }),
            ));
      }),
    );
  }
}
