import "package:Symprax/controller/itemscategories_list.dart";
import "package:Symprax/core/function/translatedatabase.dart";
import "package:Symprax/data/model/categoriesmodel.dart";
import "package:Symprax/linkapi.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import 'package:cached_network_image/cached_network_image.dart';

class Customlistcategoriesitems
    extends GetView<ItemscategoriesListcontrollerImp> {
  const Customlistcategoriesitems({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 85.2.h,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.categories.length,
            itemBuilder: (context, i) {
              return Categories(
                  index: i,
                  categoriesModel:
                      CategoriesModel.fromJson(controller.categories[i]));
            }));
  }
}

class Categories extends GetView<ItemscategoriesListcontrollerImp> {
  final CategoriesModel categoriesModel;
  final int? index;
  const Categories(
      {super.key, required this.categoriesModel, required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.changecat(index!);
        },
        child: Column(children: [
          GetBuilder<ItemscategoriesListcontrollerImp>(builder: (controller) {
            return Container(
                child: controller.selectCat == index
                    ? Stack(children: [
                        Container(
                            width: 380.w,
                            height: 82.5.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20.r),
                            )),
                        Positioned(
                          child: SizedBox(
                              height: 85.h,
                              width: 170.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${Applink.imagecategories}/${categoriesModel.categoriesImage}",
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                        controller.myservices.sharedPreferences
                                    .getString("lang") ==
                                "en"
                            ? Positioned(
                                left: 180.w,
                                top: 10.h,
                                child: Text("72".tr,
                                    style: TextStyle(
                                        fontFamily: "BebasNeue",
                                        fontSize: 16.5.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700])))
                            : Positioned(
                                right: 180.w,
                                top: 10.h,
                                child: Text("72".tr,
                                    style: TextStyle(
                                        fontSize: 15.5,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700]))),
                        controller.myservices.sharedPreferences
                                    .getString("lang") ==
                                "en"
                            ? Positioned(
                                left: 180.w,
                                top: 52.h,
                                child: Row(
                                  children: [
                                    Text(
                                        "${translatedatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)} ",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontFamily: "BebasNeue",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey)),
                                    Icon(
                                      EvaIcons.activity,
                                      color: Colors.white70,
                                      size: 25.w,
                                    )
                                  ],
                                ))
                            : Positioned(
                                right: 180.w,
                                top: 48.h,
                                child: Row(
                                  children: [
                                    Text(
                                        "${translatedatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)} ",
                                        style: TextStyle(
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey)),
                                    Icon(
                                      EvaIcons.activity,
                                      color: Colors.white70,
                                      size: 25.w,
                                    )
                                  ],
                                ))
                      ])
                    : null);
          }),
        ]));
  }
}
