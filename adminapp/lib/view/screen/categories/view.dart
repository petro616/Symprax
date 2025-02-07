import 'package:AdminApp/controller/categories/view_controller.dart';
import 'package:AdminApp/core/class/handlingdataview.dart';
import 'package:AdminApp/core/constant/colors.dart';
import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/linkapi.dart';
import 'package:AdminApp/view/widget/categories/expanded_image_view.dart';
import 'package:AdminApp/view/widget/categories/floating_button_view.dart';
import 'package:AdminApp/view/widget/categories/subtitle_listtile.dart';
import 'package:AdminApp/view/widget/categories/title_listtile.dart';
import 'package:AdminApp/view/widget/categories/trailing_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categoriesview extends StatelessWidget {
  const Categoriesview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesViewControllerimp());
    return Scaffold(
        floatingActionButton: FloatingButtonView(onPressed: () {
          Get.toNamed(AppRoute.categoriesadd);
        }),
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(title: Text("Categories View")),
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: ((didpop, result) {
            if (didpop) {
              return;
            }
            Get.offAllNamed(AppRoute.homePage);
          }),
          child: GetBuilder<CategoriesViewControllerimp>(builder: (controller) {
            return Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, i) {
                      return Card(
                          child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: ExpandedImageView(
                                  image:
                                      "${Applink.imagecategories}/${controller.data[i].categoriesImage}")),
                          Expanded(
                              flex: 3,
                              child: ListTile(
                                  title: TitleListtile(
                                      title:
                                          "${controller.data[i].categoriesName}"),
                                  subtitle: SubtitleListtile(
                                      title:
                                          "${controller.data[i].categoriesDatetime}"),
                                  trailing: TrailingListtile(
                                      onConfirmDefaultDialog: () {
                                    controller.delete(
                                        controller.data[i].categoriesId!,
                                        controller.data[i].categoriesImage!);
                                    Get.back();
                                  }, onPressedIconButtonEdit: () {
                                    controller
                                        .goToEditCategory(controller.data[i]);
                                  })))
                        ],
                      ));
                    }));
          }),
        ));
  }
}
