import 'package:AdminApp/controller/items/add_controller.dart';
import 'package:AdminApp/core/class/handlingdataview.dart';
import 'package:AdminApp/core/constant/colors.dart';
import 'package:AdminApp/core/shared(shortcuts)/custom_dropdownlist_search.dart';
import 'package:AdminApp/view/widget/items/add_second_third_images.dart';
import 'package:AdminApp/view/widget/items/button_add_second_third_images.dart';
import 'package:AdminApp/view/widget/items/show_second_third_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddMorephotos extends StatelessWidget {
  const AddMorephotos({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ItemsAddControllerimp itemsAddControllerimp =
        Get.put(ItemsAddControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: Text("More Photos"),
        ),
        body: Form(
          key: itemsAddControllerimp.formstate2,
          child: GetBuilder<ItemsAddControllerimp>(builder: (controller) {
            return Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    SizedBox(height: 20.h),
                    CustomDropdownlistSearch(
                      title: "Choose Product",
                      listdata: controller.dropdownsearchlistitems,
                      dropDownNameController: controller.itemsid,
                      dropDownIdController: controller.catid,
                    ),
                    SizedBox(height: 20.h),
                    AddSecondAndThirdImagesForItems(
                        onPressed: () {
                          controller.choosesecondfile();
                        },
                        title: "Click Here To Add Second Image"),
                    if (controller.file2 != null)
                      ShowSecondAndThirdImagesForItems(
                          image: controller.file2!),
                    AddSecondAndThirdImagesForItems(
                        onPressed: () {
                          controller.choosethirdfile();
                        },
                        title: "Click Here To Add Third Image"),
                    if (controller.file3 != null)
                      ShowSecondAndThirdImagesForItems(
                          image: controller.file3!),
                    ButtonAddSecondAndThirdImagesForItems(
                        title: "Add Product",
                        onPressed: () {
                          controller.addsecondphoto();
                        })
                  ],
                ));
          }),
        ));
  }
}
