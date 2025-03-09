import 'package:Symprax/controller/myfavourite_controller.dart';
import 'package:Symprax/core/function/translatedatabase.dart';
import 'package:Symprax/data/model/itemsmodel.dart';
import 'package:Symprax/data/model/myfavourite.dart';
import 'package:Symprax/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomCardfavourite extends GetView<MyfavouriteController> {
  final Myfavouritemodel itemsModel;
  final ItemsModel itemsModel2;
  const CustomCardfavourite({
    super.key,
    required this.itemsModel,
    required this.itemsModel2,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotoproductdetails(itemsModel2);
        },
        child: Card(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                SizedBox(
                  height: 190.h,
                  width: double.infinity.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.r),
                    child: CachedNetworkImage(
                        imageUrl:
                            "${Applink.imageitems}/${itemsModel.itemsImage}",
                        fit: BoxFit.cover),
                  ),
                ),
                controller.myservices.sharedPreferences.getString("lang") ==
                        "en"
                    ? Container(
                        alignment: Alignment.center,
                        height: 22.h,
                        width: 300.w,
                        margin: EdgeInsets.only(top: 2.h),
                        child: Text(
                          "${translatedatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                          style: TextStyle(
                              fontFamily: "BebasNeue",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 19.sp),
                        ),
                      )
                    : Container(
                        alignment: Alignment.center,
                        height: 24.h,
                        width: 300.w,
                        margin: EdgeInsets.only(top: 2.h),
                        child: Text(
                          "${translatedatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ),
                Container(
                  margin: EdgeInsets.only(top: 3.h),
                  height: 30.h,
                  //  width: 245.w,
                  child: Text(
                    "76".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        fontFamily: "BebasNeue",
                        color: Colors.grey),
                  ),
                ),
                controller.myservices.sharedPreferences.getString("lang") ==
                        "en"
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 17.w),
                            child: Text(
                              "${itemsModel.itemspricediscount} S.Y.P",
                              style: TextStyle(
                                  fontSize: 19.sp,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "BebasNeue"),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 10.w),
                              child: InkWell(
                                onTap: () {
                                  controller.deletemyfavourite(
                                      itemsModel.favoutireId!);
                                },
                                child: const Icon(
                                  Icons.delete_outline,
                                ),
                              ))
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 10.w),
                              child: InkWell(
                                onTap: () {
                                  controller.deletemyfavourite(
                                      itemsModel.favoutireId!);
                                },
                                child: const Icon(
                                  Icons.delete_outline,
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.only(left: 17.w),
                            child: Text(
                              "${itemsModel.itemspricediscount} S.Y.P",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "BebasNeue"),
                            ),
                          ),
                        ],
                      )
              ],
            )));
  }
}
