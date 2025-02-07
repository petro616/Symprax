import "package:Symprax/controller/home_page_controller.dart";
import "package:Symprax/core/function/translatedatabase.dart";
import "package:Symprax/data/model/itemsmodel.dart";
import "package:Symprax/linkapi.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import 'package:cached_network_image/cached_network_image.dart';

class Customitemslist extends GetView<HomePageControllerimp> {
  const Customitemslist({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, i) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.items[i]),
            );
          }),
    );
  }
}

class Items extends GetView<HomePageControllerimp> {
  final ItemsModel itemsModel;

  const Items({
    super.key,
    required this.itemsModel,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotoproductdetails(itemsModel);
        },
        child: Card(
            color: Colors.white,
            margin: controller.myServices.sharedPreferences.getString("lang") ==
                    "en"
                ? EdgeInsets.only(right: 7.w, top: 1.h)
                : EdgeInsets.only(left: 7.w, top: 1.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(30.r, 30.r),
              bottomLeft: Radius.elliptical(30.r, 30.r),
            )),
            child: Column(
              children: [
                SizedBox(
                  height: 130.h,
                  width: 200.w,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(30.r, 30.r),
                        bottomLeft: Radius.elliptical(30.r, 30.r),
                      ),
                      child: CachedNetworkImage(
                          imageUrl:
                              "${Applink.imageitems}/${itemsModel.itemsImage}",
                          fit: BoxFit.cover)),
                ),
                controller.myServices.sharedPreferences.getString("lang") ==
                        "en"
                    ? Container(
                        alignment: Alignment.center,
                        height: 22.h,
                        width: 180.w,
                        margin: EdgeInsets.only(top: 2.h),
                        child: Text(
                          "${translatedatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                          style: TextStyle(
                              fontFamily: "BebasNeue",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      )
                    : Container(
                        alignment: Alignment.center,
                        height: 22.h,
                        width: 160.w,
                        margin: EdgeInsets.only(top: 2.h),
                        child: Text(
                          "${translatedatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp),
                        )),
                controller.myServices.sharedPreferences.getString("lang") ==
                        "en"
                    ? SizedBox(
                        height: 40.h,
                        width: 145.w,
                        child: Text(
                          "68".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              fontFamily: "BebasNeue",
                              color: Colors.grey),
                        ),
                      )
                    : SizedBox(
                        height: 40.h,
                        width: 145.w,
                        child: Text(
                          "68".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.5.sp,
                              color: Colors.grey),
                        )),
              ],
            )));
  }
}
