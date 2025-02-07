import "package:Symprax/controller/favourite_controller.dart";
import "package:Symprax/controller/itemscategories_list.dart";
import "package:Symprax/core/class/handlingdataview.dart";
import "package:Symprax/core/constant/colors.dart";
import "package:Symprax/core/constant/routes.dart";
import "package:Symprax/view/screen/home.dart";
import "package:Symprax/view/widget/customappbar.dart";
import "package:Symprax/view/widget/items/customitems_cat_card.dart";
import "package:Symprax/view/widget/items/customlistcategoriesitems.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class ItemsInCategorieslist extends GetView<ItemscategoriesListcontrollerImp> {
  const ItemsInCategorieslist({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ItemscategoriesListcontrollerImp());
    FavouriteController controllerfav = Get.put(FavouriteController());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        body: Container(
            padding: EdgeInsets.only(right: 8.w, left: 8.w, top: 5.h),
            child: ListView(children: [
              Row(spacing: 1.w, children: [
                Expanded(
                  flex: 8,
                  child: Customappbar(
                      mycontroller: controller.search!,
                      onChanged: (val) {
                        controller.checksearch(val);
                      },
                      onPressedSearch: () {
                        controller.onpressediconsearch();
                      },
                      titlehintText: "69".tr),
                ),
                controller.myServices.sharedPreferences.getString("lang") ==
                        "en"
                    ? Expanded(
                        child: IconButton(
                        icon: Icon(
                          EvaIcons.arrowCircleRight,
                          size: 32.w,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Get.offAllNamed(AppRoute.homescreen);
                        },
                      ))
                    : Expanded(
                        child: IconButton(
                          icon: Icon(
                            EvaIcons.arrowCircleLeft,
                            size: 32.w,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.offAllNamed(AppRoute.homescreen);
                          },
                        ),
                      )
              ]),
              SizedBox(height: 10.h),
              const Customlistcategoriesitems(),
              SizedBox(height: 10.h),
              GetBuilder<ItemscategoriesListcontrollerImp>(
                  builder: (controller) {
                return Handlingdataview(
                    statusRequest: controller.statusRequest,
                    widget: controller.issearch == false
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, mainAxisExtent: 192.h),
                            itemCount: controller.data.length,
                            itemBuilder: (BuildContext context, i) {
                              controllerfav
                                      .isfavourite[controller.data[i].itemsId] =
                                  controller.data[i].favoutire;
                              return CustomitemsCatCard(
                                  itemsModel: controller.data[i]);
                            })
                        : Listsearch(modelListdata: controller.listdata));
              })
            ])));
  }
}
