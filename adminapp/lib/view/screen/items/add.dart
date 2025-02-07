import 'package:AdminApp/controller/items/add_controller.dart';
import 'package:AdminApp/core/class/handlingdataview.dart';
import 'package:AdminApp/core/constant/colors.dart';
import 'package:AdminApp/core/function/validinput.dart';
import 'package:AdminApp/core/shared(shortcuts)/custom_dropdownlist_search.dart';
import 'package:AdminApp/core/shared(shortcuts)/customtextformglobal.dart';
import 'package:AdminApp/view/widget/items/add_edit_image.dart';
import 'package:AdminApp/view/widget/items/button_add_edit_items.dart';
import 'package:AdminApp/view/widget/items/show_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Itemsadd extends StatelessWidget {
  const Itemsadd({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsAddControllerimp controllerimp = Get.put(ItemsAddControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(title: Text("Add Product")),
        body: Form(
            key: controllerimp.formstate,
            child: GetBuilder<ItemsAddControllerimp>(builder: (controller) {
              return Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    SizedBox(height: 20.h),
                    Customtextformglobal(
                        readOnly: false,
                        hint: "name",
                        label: "Product name",
                        icon: Icons.category,
                        mycontroller: controller.name,
                        validatores: (val) {
                          return validinput(val!, 1, 30, "username");
                        },
                        keyboardTypeform: TextInputType.text),
                    SizedBox(height: 20.h),
                    Customtextformglobal(
                        readOnly: false,
                        hint: "name (ARABIC)",
                        label: "Product name (ARABIC)",
                        icon: Icons.category,
                        mycontroller: controller.namear,
                        validatores: (val) {
                          return validinput(val!, 1, 30, "");
                        },
                        keyboardTypeform: TextInputType.text),
                    SizedBox(height: 20.h),
                    Customtextformglobal(
                        readOnly: false,
                        hint: "Description",
                        label: "Product Description",
                        icon: Icons.description_outlined,
                        mycontroller: controller.desc,
                        validatores: (val) {
                          return validinput(val!, 1, 30, "");
                        },
                        keyboardTypeform: TextInputType.text),
                    SizedBox(height: 20.h),
                    Customtextformglobal(
                        readOnly: false,
                        hint: "Description (ARABIC)",
                        label: "Product Description (ARABIC)",
                        icon: Icons.description_outlined,
                        mycontroller: controller.descar,
                        validatores: (val) {
                          return validinput(val!, 1, 30, "");
                        },
                        keyboardTypeform: TextInputType.text),
                    SizedBox(height: 20.h),
                    Customtextformglobal(
                        readOnly: false,
                        hint: "Count",
                        label: "Product Count",
                        icon: Icons.numbers_outlined,
                        mycontroller: controller.count,
                        validatores: (val) {
                          return validinput(val!, 1, 30, "");
                        },
                        keyboardTypeform: TextInputType.number),
                    SizedBox(height: 20.h),
                    Customtextformglobal(
                        readOnly: false,
                        hint: "Price",
                        label: "Product Price",
                        icon: Icons.price_change,
                        mycontroller: controller.price,
                        validatores: (val) {
                          return validinput(val!, 1, 30, "");
                        },
                        keyboardTypeform: TextInputType.number),
                    SizedBox(height: 20.h),
                    Customtextformglobal(
                        readOnly: false,
                        hint: "Discount",
                        label: "Product Discount",
                        icon: Icons.discount,
                        mycontroller: controller.discount,
                        validatores: (val) {
                          return validinput(val!, 1, 30, "");
                        },
                        keyboardTypeform: TextInputType.number),
                    SizedBox(height: 20.h),
                    CustomDropdownlistSearch(
                      title: "Choose Category",
                      listdata: controller.dropdownsearchlistcat,
                      dropDownNameController: controller.catname,
                      dropDownIdController: controller.catid,
                    ),
                    AddEditImageForItems(
                        title: "Click Here To Add Main Image",
                        onPressed: () {
                          controller.choosefile();
                        }),
                    if (controller.file != null)
                      ShowImageForItems(image: controller.file!),
                    ButtonAddOrEditItems(
                        title: "Add Product",
                        onPressed: () {
                          controller.add();
                        })
                  ],
                ),
              );
            })));
  }
}
