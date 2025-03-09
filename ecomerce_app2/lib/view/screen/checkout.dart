import 'package:Symprax/controller/checkout_controller.dart';
import 'package:Symprax/core/class/handlingdataview.dart';
import 'package:Symprax/core/constant/colors.dart';
import 'package:Symprax/view/widget/checkout/choosedeliverytype.dart';
import 'package:Symprax/view/widget/checkout/choosepaymentmethod.dart';
import 'package:Symprax/view/widget/checkout/chooseshippingaddress.dart';
import 'package:Symprax/view/widget/checkout/choosetext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});
  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: AppColor.primarysecondcolor,
          height: 40.h,
          child: MaterialButton(
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: Text(
              "94".tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
          ),
        ),
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: Text(
            "86".tr,
          ),
        ),
        body: GetBuilder<CheckoutController>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.only(left: 13.w, right: 13.h),
                child: ListView(
                  children: [
                    Choosetext(title: "87".tr),
                    SizedBox(height: 10.h),
                    InkWell(
                        onTap: () {
                          controller.choosepaymentmethod("0");
                        },
                        child: Choosepaymentmethod(
                            title: "88".tr,
                            isactive: controller.paymentmethod == "0"
                                ? true
                                : false)),
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {
                        controller.choosepaymentmethod("1");
                      },
                      child: Choosepaymentmethod(
                          title: "89".tr,
                          isactive:
                              controller.paymentmethod == "1" ? true : false),
                    ),
                    Choosetext(title: "90".tr),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.choosedeliverytype("0");
                          },
                          child: Choosedeliverytype(
                              title: "91".tr,
                              icon: Icons.delivery_dining_rounded,
                              isactive: controller.deliverytype == "0"
                                  ? true
                                  : false),
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosedeliverytype("1");
                          },
                          child: Choosedeliverytype(
                              title: "92".tr,
                              icon: Icons.person_pin_circle_outlined,
                              isactive: controller.deliverytype == "1"
                                  ? true
                                  : false),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    if (controller.deliverytype == "0" &&
                        controller.dataaddress.isNotEmpty)
                      Column(
                        children: [
                          Choosetext(title: "93".tr),
                          SizedBox(height: 10.h),
                          ...List.generate(controller.dataaddress.length,
                              (index) {
                            return InkWell(
                              onTap: () {
                                controller.chooseshippingaddress(
                                    controller.dataaddress[index].adressId!);
                              },
                              child: Chooseshippingaddress(
                                  title:
                                      "${controller.dataaddress[index].adressName}",
                                  subtitle:
                                      "${controller.dataaddress[index].adressCity} / ${controller.dataaddress[index].adressStreet}",
                                  phone: controller
                                      .dataaddress[index].adressPhone!,
                                  isactive: controller.shippingaddressid ==
                                          controller.dataaddress[index].adressId
                                      ? true
                                      : false),
                            );
                          }),
                        ],
                      ),
                    if (controller.dataaddress.isEmpty &&
                        controller.deliverytype == "0")
                      Column(
                        children: [
                          SizedBox(height: 20.h),
                          Text(
                            "174".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                  ],
                ),
              ));
        }));
  }
}
