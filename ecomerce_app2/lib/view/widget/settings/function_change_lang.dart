import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:Symprax/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

changelanguage(context) {
  AwesomeDialog(
      customHeader: Icon(
        Icons.language_sharp,
        color: Colors.blueGrey,
        size: 45.w,
      ),
      context: context,
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 20.h),
              child: Text(
                "121".tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold),
              )),
          Container(
              margin: EdgeInsets.only(bottom: 20.h),
              child: GetBuilder<LocalController>(builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      textColor: Colors.white,
                      color: Colors.blueGrey,
                      onPressed: () {
                        controller.changeLang("ar");
                      },
                      child: Text(
                        "123".tr,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    MaterialButton(
                      textColor: Colors.white,
                      color: Colors.blueGrey,
                      onPressed: () {
                        controller.changeLang("en");
                      },
                      child: Text(
                        "122".tr,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                );
              }))
        ],
      )).show();
}
