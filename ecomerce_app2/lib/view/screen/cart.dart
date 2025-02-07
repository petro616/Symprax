import 'package:Symprax/controller/cart_controller.dart';
import 'package:Symprax/core/class/handlingdataview.dart';
import 'package:Symprax/core/function/translatedatabase.dart';
import 'package:Symprax/view/widget/cart/bill.dart';
import 'package:Symprax/view/widget/cart/cartitems.dart';
import 'package:Symprax/view/widget/cart/custombuttomcoupon.dart';
import 'package:Symprax/view/widget/cart/customcartbutton.dart';
import 'package:Symprax/view/widget/cart/customcoupontextfield.dart';
import 'package:Symprax/view/widget/cart/firstbackgroundcolor_title.dart';
import 'package:Symprax/view/widget/cart/firstbackgroundcolor_cart.dart';
import 'package:Symprax/view/widget/cart/white_space_for_elements_cart.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController());
    return GetBuilder<CartController>(builder: (controller) {
      return Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: ListView(children: [
            Stack(
              children: [
                const FirstbackgroundcolorCart(
                  color: Color.fromARGB(255, 223, 177, 104),
                ),
                Firstbackgroundcolortitle(
                  title: "77".tr,
                  icon: EvaIcons.shoppingCart,
                ),
                WhiteSpaceForElementsCart(
                    widget: Column(
                  children: [
                    ...List.generate(controller.data.length, (index) {
                      return Cartitems(
                        imagename: "${controller.data[index].itemsImage}",
                        title:
                            "${translatedatabase(controller.data[index].itemsNameAr, controller.data[index].itemsName)}",
                        price: "${controller.data[index].itemsprice}",
                        count: "${controller.data[index].countitems}",
                        onadd: () async {
                          await controller.add(controller.data[index].itemsId!);
                          controller.refreshvariablecartview();
                        },
                        ondelete: () async {
                          await controller
                              .delete(controller.data[index].itemsId!);
                          controller.refreshvariablecartview();
                        },
                      );
                    }),
                    SizedBox(height: 20.h),
                    controller.couponname == null
                        ? Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Customcoupontextfield(
                                  couponcontroller: controller.couponcode,
                                )),
                                SizedBox(width: 5.w),
                                Expanded(child: Custombuttomcoupon(
                                  onPressed: () {
                                    controller.getcoupon();
                                  },
                                ))
                              ],
                            ),
                          )
                        : SizedBox(
                            child: Text(
                              "coupon name : ${controller.couponname}",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp),
                            ),
                          ),
                    SizedBox(height: 10.h),
                    Bill(
                      title: "80".tr,
                      price: "${controller.totalcount}",
                      pricecolor: Colors.grey,
                    ),
                    Bill(
                        title: "81".tr,
                        price: "${controller.totalprice} S.Y.P",
                        pricecolor: Colors.grey),
                    Bill(
                      title: "82".tr,
                      price: "${controller.discountcoupon} %",
                      pricecolor: Colors.grey,
                    ),
                    Bill(
                      title: "83".tr,
                      price: "0.0",
                      pricecolor: Colors.grey,
                    ),
                    const Divider(),
                    Bill(
                        title: "84".tr,
                        price: "${controller.gettotalprice()} S.Y.P",
                        pricecolor: Colors.blueGrey),
                    Customcartbutton(
                      onPressed: () {
                        controller.gotocheckout();
                      },
                    )
                  ],
                ))
              ],
            )
          ]));
    });
  }
}
