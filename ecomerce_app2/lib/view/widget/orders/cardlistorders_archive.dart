import 'package:Symprax/controller/orders/archieve_controller.dart';
import 'package:Symprax/core/constant/colors.dart';
import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/data/model/ordersmodel.dart';
import 'package:Symprax/view/widget/orders/dialog_rating.dart';
import 'package:Symprax/view/widget/orders/order_state_title.dart';
import 'package:Symprax/view/widget/orders/orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardlistordersArchive extends GetView<ArchieveController> {
  final OrdersModel ordersModel;
  const CardlistordersArchive({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0.w),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                OrderStateTitle(title: "${"125".tr}${ordersModel.ordersId}"),
                Spacer(),
                controller.myservices.sharedPreferences.getString("lang") ==
                        "en"
                    ? OrderStateTitle(
                        title: Jiffy.parse('${ordersModel.ordersDatetime}')
                            .fromNow())
                    : Text(""),
              ]),
              Divider(),
              SizedBox(height: 3.h),
              OrdersState(
                  title:
                      "${"126".tr}${controller.printOrderType(ordersModel.ordersType!)}"),
              OrdersState(title: "${"127".tr}${ordersModel.ordersPrice} s.y.p"),
              OrdersState(
                  title: "${"128".tr}${ordersModel.ordersShipingprice} s.y.p"),
              OrdersState(
                  title:
                      "${"129".tr}${controller.printPaymentMethod(ordersModel.ordersPaymentmethod!)}"),
              OrdersState(
                  title:
                      "${"130".tr}${controller.printOrderStatus(ordersModel.ordersStatus!)}"),
              Divider(),
              Row(
                children: [
                  Text(
                    "${"131".tr}${ordersModel.ordersTotalprice}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        fontFamily: "BebasNeue",
                        fontSize: 19.sp),
                  ),
                  Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.orderdetails,
                          arguments: {"ordersmodel": ordersModel});
                    },
                    color: AppColor.homepagecolorbackground,
                    textColor: Colors.blueGrey,
                    child: Text(
                      "132".tr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  if (ordersModel.ordersRating == "0")
                    MaterialButton(
                      onPressed: () {
                        showdialograting(context, ordersModel.ordersId!);
                      },
                      color: AppColor.homepagecolorbackground,
                      textColor: Colors.blueGrey,
                      child: Text(
                        "139".tr,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
