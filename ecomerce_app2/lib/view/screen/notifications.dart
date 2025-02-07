import 'package:Symprax/controller/notifications_controller.dart';
import 'package:Symprax/core/class/handlingdataview.dart';
import 'package:Symprax/core/constant/colors.dart';
import 'package:Symprax/view/widget/cart/firstbackgroundcolor_title.dart';
import 'package:Symprax/view/widget/notifications/card_shape.dart';
import 'package:Symprax/view/widget/notifications/notification_body.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NotificationsController());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        body: GetBuilder<NotificationsController>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Firstbackgroundcolortitle(
                              title: "95".tr, icon: EvaIcons.bell)
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50.h),
                        child: Column(
                          children: [
                            ...List.generate(controller.data.length, (i) {
                              return Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  child: CardShape(
                                      widget: Stack(
                                    children: [
                                      ListTile(
                                        title: NotificationBody(
                                            title:
                                                "${controller.data[i]["notifications_title"]}"),
                                        subtitle: NotificationBody(
                                            title:
                                                "-> ${controller.data[i]["notifications_body"]}"),
                                      ),
                                      controller.myservices.sharedPreferences
                                                  .getString("lang") ==
                                              "en"
                                          ? Positioned(
                                              right: 20.w,
                                              bottom: 31.h,
                                              child: Text(
                                                Jiffy.parse(
                                                        "${controller.data[i]["notifications_datetime"]}")
                                                    .fromNow(),
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: "BebasNeue",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.sp),
                                              ),
                                            )
                                          : Text("")
                                    ],
                                  )));
                            })
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ));
        }));
  }
}
