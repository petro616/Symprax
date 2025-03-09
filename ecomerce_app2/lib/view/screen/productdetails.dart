import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:Symprax/controller/productdetails_controller.dart';
import 'package:Symprax/core/class/handlingdataview.dart';
import 'package:Symprax/core/constant/colors.dart';
import 'package:Symprax/core/constant/imageasset.dart';
import 'package:Symprax/core/function/translatedatabase.dart';
import 'package:Symprax/linkapi.dart';
import 'package:Symprax/view/widget/productdetails_widget/custom_discription.dart';
import 'package:Symprax/view/widget/productdetails_widget/custom_nameproduct.dart';
import 'package:Symprax/view/widget/productdetails_widget/custom_price.dart';
import 'package:Symprax/view/widget/productdetails_widget/custom_productimage.dart';
import 'package:Symprax/view/widget/productdetails_widget/customproduct_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProductdetailsControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        bottomNavigationBar:
            GetBuilder<ProductdetailsControllerimp>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: Container(
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical: BorderSide(color: Colors.white, width: 5.w))),
                child: MaterialButton(
                  height: 40.h,
                  color: Colors.blueGrey,
                  onPressed: () {
                    controller.count != 0
                        ? AwesomeDialog(
                            dismissOnTouchOutside: false,
                            isDense: false,
                            dialogBackgroundColor: Colors.blueGrey,
                            autoHide: Duration(milliseconds: 4350),
                            bodyHeaderDistance: 0,
                            padding: EdgeInsets.all(10.w),
                            context: context,
                            dialogType: DialogType.noHeader,
                            body: Column(
                              children: [
                                Text(
                                  "BEST WISHES",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5.h),
                                Lottie.asset(
                                  AppImageAsset.addtocart,
                                ),
                              ],
                            )).show()
                        : Get.snackbar("181".tr, "182".tr);
                  },
                  child: Text(
                    "73".tr,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ));
        }),
        body: GetBuilder<ProductdetailsControllerimp>(builder: (controller) {
          return ListView(children: [
            CustomProductimage(
              images: [
                "${Applink.imageitems}/${controller.itemsModel.itemsImage}",
                "${Applink.imageitems}/${controller.itemsModel.productsImage2}",
                "${Applink.imageitems}/${controller.itemsModel.productsImage3}"
              ],
            ),
            SizedBox(height: 38.h),
            Stack(
              children: [
                Container(
                    height: Get.height.h,
                    width: double.infinity.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5.w),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(100.r, 100.r)),
                      color: const Color.fromARGB(255, 251, 221, 174),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomNameproduct(
                              text:
                                  "${translatedatabase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}"),
                          CustomDiscription(
                              text:
                                  "${translatedatabase(controller.itemsModel.itemsDescriptionAr, controller.itemsModel.itemsDescription)}"),
                          //  const CustomColor(),
                          CustomproductCount(
                              startText: "${"74".tr} ->",
                              onAdd: () {
                                controller.addfrontend();
                              },
                              onMinus: () {
                                controller.removefrontend();
                              },
                              count: "${controller.count}"),
                          CustomPrice(
                              price:
                                  "${controller.itemsModel.itemspricediscount}")
                        ],
                      ),
                    )),
              ],
            ),
          ]);
        }));
  }
}
