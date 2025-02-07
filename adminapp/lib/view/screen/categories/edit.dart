import 'package:AdminApp/controller/categories/edit_controller.dart';
import 'package:AdminApp/core/class/handlingdataview.dart';
import 'package:AdminApp/core/constant/colors.dart';
import 'package:AdminApp/core/function/validinput.dart';
import 'package:AdminApp/core/shared(shortcuts)/customtextformglobal.dart';
import 'package:AdminApp/view/widget/categories/add_edit_image.dart';
import 'package:AdminApp/view/widget/categories/button_add_edit_category.dart';
import 'package:AdminApp/view/widget/categories/show_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categoriesedit extends StatelessWidget {
  const Categoriesedit({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesEditControllerimp controllerimp =
        Get.put(CategoriesEditControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(title: Text("Edit Category")),
        body: Form(
            key: controllerimp.formstate,
            child:
                GetBuilder<CategoriesEditControllerimp>(builder: (controller) {
              return Handlingdataview(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ListView(
                      children: [
                        Customtextformglobal(
                            readOnly: false,
                            hint: "Category name",
                            label: "category name",
                            icon: Icons.category,
                            mycontroller: controller.name,
                            validatores: (val) {
                              return validinput(val!, 1, 30, "username");
                            },
                            keyboardTypeform: TextInputType.text),
                        SizedBox(height: 25),
                        Customtextformglobal(
                            readOnly: false,
                            hint: "Category name (ARABIC)",
                            label: "category name (ARABIC)",
                            icon: Icons.category,
                            mycontroller: controller.namear,
                            validatores: (val) {
                              return validinput(val!, 1, 30, "");
                            },
                            keyboardTypeform: TextInputType.text),
                        AddOrEditImageForCategories(
                            title: "Click Here To Edit Image",
                            onPressed: () {
                              controller.choosefile();
                            }),
                        if (controller.file != null)
                          ShowImageForCategories(image: controller.file!),
                        ButtonAddOrEditCategory(
                            title: "Edit Category",
                            onPressed: () {
                              controller.edit();
                            })
                      ],
                    ),
                  ));
            })));
  }
}
