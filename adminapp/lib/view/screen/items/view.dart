import 'package:AdminApp/controller/items/view_controller.dart';
import 'package:AdminApp/core/class/handlingdataview.dart';
import 'package:AdminApp/core/constant/colors.dart';
import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/linkapi.dart';
import 'package:AdminApp/view/widget/categories/floating_button_view.dart';
import 'package:AdminApp/view/widget/items/expanded_image_view.dart';
import 'package:AdminApp/view/widget/items/subtitle_listtile_.dart';
import 'package:AdminApp/view/widget/items/title_listtile.dart';
import 'package:AdminApp/view/widget/items/trailing_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemsview extends StatelessWidget {
  const Itemsview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsViewControllerimp());
    return Scaffold(
        floatingActionButton: FloatingButtonView(onPressed: () {
          Get.toNamed(AppRoute.itemsadd);
        }),
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(title: Text("Products View")),
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: ((didpop, result) {
            if (didpop) {
              return;
            }
            Get.offAllNamed(AppRoute.homePage);
          }),
          child: GetBuilder<ItemsViewControllerimp>(builder: (controller) {
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
                              child: ExpandedImageViewForItems(
                                  image:
                                      "${Applink.imageitems}/${controller.data[i].itemsImage}")),
                          Expanded(
                              flex: 3,
                              child: ListTile(
                                  title: TitleListtileForItems(
                                      title: "${controller.data[i].itemsName}"),
                                  subtitle: SubtitleListTileForItems(
                                      title:
                                          "${controller.data[i].categoriesName}"),
                                  trailing: TrailingListtileForItems(
                                      onConfirmDefaultDialog: () {
                                    controller.deleteitems(
                                        controller.data[i].itemsId!,
                                        controller.data[i].itemsImage!,
                                        controller.data[i].productsImage2!,
                                        controller.data[i].productsImage3!);
                                    Get.back();
                                  })))
                        ],
                      ));
                    }));
          }),
        ));
  }
}
