import "package:Symprax/core/constant/routes.dart";
import "package:Symprax/core/localization/changelocal.dart";
import "package:Symprax/view/widget/language/custombutonlang.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class Language extends GetView<LocalController> {
  const Language({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[50],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "1".tr,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 15.h),
            Custombutonlang(
              text: "54".tr,
              onPressed: () {
                controller.changeLang("ar");
                Get.offNamed(AppRoute.onboarding);
              },
            ),
            SizedBox(height: 10.h),
            Custombutonlang(
              text: "55".tr,
              onPressed: () {
                controller.changeLang("en");
                Get.offNamed(AppRoute.onboarding);
              },
            )
          ],
        ));
  }
}
