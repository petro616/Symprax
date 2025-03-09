import "package:Symprax/controller/address/addaddressparttwo.dart";
import "package:Symprax/core/class/handlingdataview.dart";
import "package:Symprax/core/constant/colors.dart";
import "package:Symprax/core/function/validinput.dart";
import "package:Symprax/view/widget/auth/custombuttonauth.dart";
import "package:Symprax/view/widget/auth/customtextform.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

//ignore:camel_case_types
class Addaddressparttwo extends StatelessWidget {
  const Addaddressparttwo({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(Addaddressparttwocontroller());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: Text("109".tr),
        ),
        body: GetBuilder<Addaddressparttwocontroller>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: SizedBox(
                  child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    SizedBox(height: 25.h),
                    Customtextform(
                        hint: "111".tr,
                        label: "110".tr,
                        icon: Icons.near_me,
                        mycontroller: controller.name,
                        validatores: (val) {
                          return validinput(val!, 2, 50, "username");
                        },
                        keyboardTypeform: TextInputType.emailAddress),
                    SizedBox(height: 25.h),
                    Customtextform(
                        hint: "113".tr,
                        label: "112".tr,
                        icon: Icons.location_city_outlined,
                        mycontroller: controller.city,
                        validatores: (val) {
                          return validinput(val!, 2, 50, "username");
                        },
                        keyboardTypeform: TextInputType.emailAddress),
                    SizedBox(height: 25.h),
                    Customtextform(
                        hint: "115".tr,
                        label: "114".tr,
                        icon: EvaIcons.edit,
                        mycontroller: controller.street,
                        validatores: (val) {
                          return validinput(val!, 2, 50, "username");
                        },
                        keyboardTypeform: TextInputType.emailAddress),
                    SizedBox(height: 25.h),
                    Customtextform(
                        hint: "117".tr,
                        label: "116".tr,
                        icon: EvaIcons.phone,
                        mycontroller: controller.phone,
                        validatores: (val) {
                          return validinput(val!, 2, 50, "phone");
                        },
                        keyboardTypeform: TextInputType.phone),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 25, right: 15, left: 20),
                      child: Custombuttonauth(
                        text: "118".tr,
                        onPressed: () {
                          controller.addaddress();
                        },
                      ),
                    )
                  ],
                ),
              )));
        }));
  }
}
