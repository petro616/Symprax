import 'package:DelieveryApp/controller/orders/details_controller.dart';
import 'package:DelieveryApp/core/class/handlingdataview.dart';
import 'package:DelieveryApp/core/constant/colors.dart';
import 'package:DelieveryApp/core/function/translatedatabase.dart';
import 'package:DelieveryApp/view/widget/orders/address_body.dart';
import 'package:DelieveryApp/view/widget/orders/address_phone.dart';
import 'package:DelieveryApp/view/widget/orders/address_title.dart';
import 'package:DelieveryApp/view/widget/orders/first_table_row.dart';
import 'package:DelieveryApp/view/widget/orders/last_table_row.dart';
import 'package:DelieveryApp/view/widget/orders/data_table_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: Text("134".tr),
        ),
        body: GetBuilder<OrderDetailsController>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: Container(
                margin: EdgeInsets.all(5.w),
                child: ListView(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(10.r, 10.r),
                              topRight: Radius.elliptical(10.r, 10.r),
                              topLeft: Radius.elliptical(45.r, 45.r),
                              bottomRight: Radius.elliptical(45.r, 45.r))),
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                        child: Column(
                          children: [
                            Table(
                              children: [
                                TableRow(children: [
                                  TitleTableRow(title: "137".tr),
                                  TitleTableRow(title: "136".tr),
                                  TitleTableRow(title: "135".tr),
                                ]),
                                ...List.generate(controller.data.length,
                                    (index) {
                                  return TableRow(children: [
                                    DataTableRow(
                                        title:
                                            "${translatedatabase(controller.data[index].itemsNameAr, controller.data[index].itemsName)}"),
                                    DataTableRow(
                                        title:
                                            "${controller.data[index].countitems}"),
                                    DataTableRow(
                                        title:
                                            "${controller.data[index].itemsprice} s.y.p")
                                  ]);
                                })
                              ],
                            ),
                            SizedBox(height: 8.h),
                            LastTableRow(
                                title:
                                    "${"138".tr}${controller.ordersModel.ordersTotalprice} S.Y.P"),
                          ],
                        ),
                      ),
                    ),
                    if (controller.ordersModel.ordersType == "0")
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.elliptical(50.r, 50.r),
                                  topLeft: Radius.elliptical(50.r, 50.r))),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AddressTitle(
                                  title:
                                      "${controller.ordersModel.adressName}"),
                              AddressBody(
                                  body:
                                      "${"106".tr}${controller.ordersModel.adressCity} / ${controller.ordersModel.adressStreet}"),
                              AddressPhone(
                                  phone:
                                      "${"107".tr}${controller.ordersModel.adressPhone}"),
                            ],
                          )),
                  ],
                ),
              ));
        }));
  }
}
