import 'package:cached_network_image/cached_network_image.dart';
import 'package:Symprax/controller/categories_controller.dart';
import 'package:Symprax/core/function/translatedatabase.dart';
import 'package:Symprax/data/model/categoriesmodel.dart';
import 'package:Symprax/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomViewallcategories extends GetView<CategoriesControllerImp> {
  const CustomViewallcategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 130.h),
          itemCount: controller.categories.length,
          itemBuilder: (BuildContext context, i) {
            return Viewallvcategories(
                index: i,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[i]));
          }),
    );
  }
}

class Viewallvcategories extends GetView<CategoriesControllerImp> {
  final CategoriesModel categoriesModel;
  final int? index;
  const Viewallvcategories(
      {super.key,
      required this.index,
      required,
      required this.categoriesModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotoItemsCategoriesList(
              controller.categories, index!, categoriesModel.categoriesId!);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(20.r, 20.r),
                bottomRight: Radius.elliptical(20.r, 20.r)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(20.r, 20.r),
                        bottomRight: Radius.elliptical(20.r, 20.r)),
                    child: CachedNetworkImage(
                      imageUrl:
                          "${Applink.imagecategories}/${categoriesModel.categoriesImage}",
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                  child: Text(
                "${translatedatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                    height: 1.8),
              ))
            ],
          ),
        ));
  }
}
