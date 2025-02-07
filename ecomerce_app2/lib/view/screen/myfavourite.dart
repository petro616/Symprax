import "package:Symprax/controller/myfavourite_controller.dart";
import "package:Symprax/core/class/handlingdataview.dart";
import "package:Symprax/core/constant/colors.dart";
import "package:Symprax/view/widget/cart/firstbackgroundcolor_title.dart";
import "package:Symprax/view/widget/myfavourite/custom_cardfavourite.dart";
import "package:Symprax/view/widget/myfavourite/firstbackgroundcolor_favourite.dart";
import "package:Symprax/view/widget/myfavourite/white_space_for_elements.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";

class Myfavourite extends StatelessWidget {
  const Myfavourite({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyfavouriteController());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        body: GetBuilder<MyfavouriteController>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Stack(
                    children: [
                      FirstbackgroundcolorFavourite(
                          color: Color.fromARGB(255, 223, 177, 104)),
                      Row(
                        children: [
                          Firstbackgroundcolortitle(
                              title: "75".tr, icon: EvaIcons.heart)
                        ],
                      ),
                      WhiteSpaceForElements(
                        widget: Column(
                          children: [
                            SizedBox(
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 285.h,
                                    crossAxisCount: 1,
                                  ),
                                  itemCount: controller.data.length,
                                  itemBuilder: (BuildContext context, i) {
                                    return CustomCardfavourite(
                                        itemsModel2: controller.data2[i],
                                        itemsModel: controller.data[i]);
                                  }),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ));
        }));
  }
}
