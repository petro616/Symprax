import "package:Symprax/controller/home_page_controller.dart";
import "package:Symprax/core/function/translatedatabase.dart";
import "package:Symprax/data/model/categoriesmodel.dart";
import "package:Symprax/linkapi.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import 'package:cached_network_image/cached_network_image.dart';

class Customcategorieslist extends GetView<HomePageControllerimp> {
  const Customcategorieslist({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 116.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, i) {
              return Categories(
                  index: i,
                  categoriesModel:
                      CategoriesModel.fromJson(controller.categories[i]));
            }));
  }
}

class Categories extends GetView<HomePageControllerimp> {
  final CategoriesModel categoriesModel;
  final int? index;
  const Categories(
      {super.key, required this.categoriesModel, required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotoItemsCategoriesList(
              controller.categories, index!, categoriesModel.categoriesId!);
        },
        child: Column(children: [
          controller.myServices.sharedPreferences.getString("lang") == "en"
              ? Container(
                  margin: EdgeInsets.only(right: 10.w),
                  height: 90.h,
                  width: 140.w,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${Applink.imagecategories}/${categoriesModel.categoriesImage}",
                        fit: BoxFit.cover,
                      )),
                )
              : SizedBox(
                  height: 90.h,
                  width: 140.w,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${Applink.imagecategories}/${categoriesModel.categoriesImage}",
                        fit: BoxFit.cover,
                      )),
                ),
          controller.myServices.sharedPreferences.getString("lang") == "en"
              ? Container(
                  margin: EdgeInsets.only(right: 10.w, top: 3.h),
                  height: 21.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(10.r, 10.r),
                          topRight: Radius.elliptical(10.r, 10.r)),
                      color: Colors.white),
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        translatedatabase(categoriesModel.categoriesNameAr,
                            categoriesModel.categoriesName),
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontFamily: "BebasNeue",
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold),
                      )))
              : Container(
                  margin: EdgeInsets.only(top: 3.h, left: 3.w, right: 3.w),
                  height: 21.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(10.r, 10.r),
                          topRight: Radius.elliptical(10.r, 10.r)),
                      color: Colors.white),
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        translatedatabase(categoriesModel.categoriesNameAr,
                            categoriesModel.categoriesName),
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold),
                      ))),
        ]));
  }
}
