import 'package:AdminApp/controller/items/edit_controller.dart';
import 'package:AdminApp/core/class/handlingdataview.dart';
import 'package:AdminApp/core/constant/colors.dart';
import 'package:AdminApp/core/function/validinput.dart';
import 'package:AdminApp/core/shared(shortcuts)/customtextformglobal.dart';
import 'package:AdminApp/view/widget/items/add_edit_image.dart';
import 'package:AdminApp/view/widget/items/button_add_edit_items.dart';
import 'package:AdminApp/view/widget/items/show_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Itemsedit extends StatelessWidget {
  const Itemsedit({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsEditControllerimp controllerimp = Get.put(ItemsEditControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(title: Text("Edit Product")),
        body: Form(
            key: controllerimp.formstate,
            child: GetBuilder<ItemsEditControllerimp>(builder: (controller) {
              return Handlingdataview(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ListView(
                      children: [
                        Customtextformglobal(
                            readOnly: false,
                            hint: "Product name",
                            label: "Product name",
                            icon: Icons.category,
                            mycontroller: controller.name,
                            validatores: (val) {
                              return validinput(val!, 1, 30, "username");
                            },
                            keyboardTypeform: TextInputType.text),
                        SizedBox(height: 25.h),
                        Customtextformglobal(
                            readOnly: false,
                            hint: "Product name (ARABIC)",
                            label: "Product name (ARABIC)",
                            icon: Icons.category,
                            mycontroller: controller.namear,
                            validatores: (val) {
                              return validinput(val!, 1, 30, "");
                            },
                            keyboardTypeform: TextInputType.text),
                        AddEditImageForItems(
                            title: "Click Here To Edit Image",
                            onPressed: () {
                              controller.choosefile();
                            }),
                        if (controller.file != null)
                          ShowImageForItems(image: controller.file!),
                        ButtonAddOrEditItems(
                            title: "Edit Product",
                            onPressed: () {
                              controller.edit();
                            })
                      ],
                    ),
                  ));
            })));
  }
}
