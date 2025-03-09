import 'package:Symprax/controller/offers_controller.dart';
import 'package:Symprax/core/constant/colors.dart';
import 'package:Symprax/core/function/translatedatabase.dart';
import 'package:Symprax/data/model/itemsmodel.dart';
import 'package:Symprax/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomitemsoffersCard extends GetView<OffersController> {
  final ItemsModel itemsModel;
  const CustomitemsoffersCard({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotoproductdetails(itemsModel);
        },
        child: Stack(
          children: [
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(50.r, 50.r),
                        bottomLeft: Radius.elliptical(50.r, 50.r),
                        bottomRight: Radius.elliptical(50.r, 50.r),
                        topLeft: Radius.elliptical(50.r, 50.r))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                      width: 230.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.elliptical(50.r, 50.r),
                            bottomLeft: Radius.elliptical(50.r, 50.r),
                            bottomRight: Radius.elliptical(50.r, 50.r),
                            topLeft: Radius.elliptical(50.r, 50.r)),
                        child: CachedNetworkImage(
                          imageUrl:
                              "${Applink.imageitems}/${itemsModel.itemsImage}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35.h,
                      width: 150.w,
                      margin: EdgeInsets.only(top: 2.h),
                      child: Text(
                        "${translatedatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                        style: TextStyle(
                            fontFamily: "BebasNeue",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                    ),
                    /* controller.myservices.sharedPreferences.getString("lang") ==
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
                                  fontSize: 1.sp,
                                  color: Colors.grey),
                            ),
                          )*/
                  ],
                )),
            if (itemsModel.itemsDiscount != "0")
              Positioned(
                  left: 10,
                  bottom: 125.h,
                  child: Container(
                    height: 32.h,
                    width: 32.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: AppColor.colorContaineronboarding),
                    child: Text(
                      textAlign: TextAlign.center,
                      "sale",
                      style: TextStyle(
                          height: 2.2.h,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
          ],
        ));
  }
}
