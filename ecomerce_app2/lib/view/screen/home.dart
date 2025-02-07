import "package:Symprax/controller/home_page_controller.dart";
import "package:Symprax/core/class/handlingdataview.dart";
import "package:Symprax/core/constant/colors.dart";
import "package:Symprax/core/constant/routes.dart";
import "package:Symprax/core/function/translatedatabase.dart";
import "package:Symprax/core/shared(shortcuts)/cuatom_offers.dart";
import "package:Symprax/core/shared(shortcuts)/custom_topsellings.dart";
import "package:Symprax/data/model/itemsmodel.dart";
import "package:Symprax/linkapi.dart";
import "package:Symprax/view/widget/customappbar.dart";
import "package:Symprax/view/widget/home/custom_button_goto_viewall.dart";
import "package:Symprax/view/widget/home/custom_button_goto_viewall_offers.dart";
import "package:Symprax/view/widget/home/customcard.dart";
import "package:Symprax/view/widget/home/customcategorieslist.dart";
import "package:Symprax/view/widget/home/customfirsttitle.dart";
import "package:Symprax/view/widget/home/customitemslist.dart";
import "package:Symprax/view/widget/home/customundercategoriestitle.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import 'package:cached_network_image/cached_network_image.dart';

//ignore:camel_case_types
class home extends StatelessWidget {
  const home({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerimp());
    return Scaffold(
      backgroundColor: AppColor.colorscaffoldLogin,
      body: GetBuilder<HomePageControllerimp>(builder: (controller) {
        return Container(
            padding: EdgeInsets.only(right: 8.w, left: 8.w, bottom: 5.h),
            child: ListView(
              children: [
                const Customfirsttitle(title: " Symprax"),
                SizedBox(height: 6.h),
                Customappbar(
                    mycontroller: controller.search!,
                    onChanged: (val) {
                      controller.checksearch(val);
                    },
                    onPressedSearch: () {
                      controller.onpressediconsearch();
                    },
                    titlehintText: "69".tr),
                SizedBox(height: 11.h),
                Handlingdataview(
                    statusRequest: controller.statusRequest,
                    widget: controller.issearch == false
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Customcard(
                                  image:
                                      "assets/images/IMG_20250113_202533.jpg",
                                  texttitle: ""),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Customundercategoriestitle(title: "62".tr),
                                  InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoute.viewallcategories);
                                      },
                                      child: CustomButtonGotoViewall())
                                ],
                              ),
                              const Customcategorieslist(),
                              Customundercategoriestitle(title: "64".tr),
                              const Customitemslist(),
                              SizedBox(height: 14.h),
                              const Customcard(
                                  image:
                                      "assets/images/IMG_20250113_202639.jpg",
                                  texttitle: ""),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Customundercategoriestitle(title: "65".tr),
                                  InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoute.offers);
                                      },
                                      child: CustomButtonGotoViewallOffers())
                                ],
                              ),
                              SizedBox(height: 2.h),
                              const Customitemsoffers(),
                              SizedBox(height: 14.h),
                              const Customcard(
                                  image:
                                      "assets/images/IMG_20250113_200135.jpg",
                                  texttitle: ""),
                              SizedBox(height: 3.h),
                              Customundercategoriestitle(title: "67".tr),
                              const Customitemstopsellings(),
                            ],
                          )
                        : Listsearch(modelListdata: controller.listdata))
              ],
            ));
      }),
    );
  }
}

class Listsearch extends GetView<HomePageControllerimp> {
  final List<ItemsModel> modelListdata;
  const Listsearch({super.key, required this.modelListdata});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: modelListdata.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              controller.gotoproductdetails(
                modelListdata[i],
              );
            },
            child: SizedBox(
                child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(100.r, 100.r),
                      bottomRight: Radius.elliptical(100.r, 100.r))),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.elliptical(50.r, 50.r),
                              bottomRight: Radius.elliptical(50.r, 50.r)),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${Applink.imageitems}/${modelListdata[i].itemsImage}",
                            fit: BoxFit.cover,
                            height: 120.h,
                          ))),
                  Expanded(
                      flex: 4,
                      child: ListTile(
                        title: Container(
                            margin: EdgeInsets.only(bottom: 4.h),
                            child: Text(
                              "${translatedatabase(modelListdata[i].itemsNameAr, modelListdata[i].itemsName)}",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold),
                            )),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 5.h),
                              child: Text(
                                "${translatedatabase(modelListdata[i].categoriesNameAr, modelListdata[i].categoriesName)}",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "BebasNeue"),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )),
          );
        });
  }
}
