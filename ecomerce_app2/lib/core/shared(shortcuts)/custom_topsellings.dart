import "package:Symprax/controller/home_page_controller.dart";
import "package:Symprax/core/function/translatedatabase.dart";
import "package:Symprax/data/model/itemsmodel.dart";
import "package:Symprax/linkapi.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import 'package:cached_network_image/cached_network_image.dart';

class Customitemstopsellings extends GetView<HomePageControllerimp> {
  const Customitemstopsellings({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.topselling.length,
          itemBuilder: (context, i) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.topselling[i]),
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
            margin: EdgeInsets.only(right: 5.w, bottom: 5.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(50.r, 50.r),
                    bottomLeft: Radius.elliptical(50.r, 50.r),
                    bottomRight: Radius.elliptical(50.r, 50.r),
                    topLeft: Radius.elliptical(50.r, 50.r))),
            child: Column(
              children: [
                SizedBox(
                  height: 130.h,
                  width: 190.w,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(30.r, 30.r),
                          topRight: Radius.elliptical(30.r, 30.r),
                          bottomLeft: Radius.elliptical(30.r, 30.r),
                          topLeft: Radius.elliptical(30.r, 30.r)),
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
                        width: 160.w,
                        margin: EdgeInsets.only(top: 12.h),
                        child: Text(
                          " ${translatedatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                          style: TextStyle(
                              fontFamily: "BebasNeue",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      )
                    : Container(
                        alignment: Alignment.center,
                        width: 180.w,
                        margin: EdgeInsets.only(top: 8.h),
                        child: Text(
                          " ${translatedatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp),
                        )),
              ],
            )));
  }
}
