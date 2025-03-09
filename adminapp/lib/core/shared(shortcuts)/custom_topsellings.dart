/*import "package:ecomerce_app2/controller/home_page_controller.dart";
import "package:ecomerce_app2/data/model/itemsmodel.dart";
import "package:ecomerce_app2/linkapi.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:cached_network_image/cached_network_image.dart';

class Customitemstopsellings extends GetView<HomePageControllerimp> {
  const Customitemstopsellings({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.topselling.length,
          itemBuilder: (context, i) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.topselling[i]),
            );
          }),
    );
  }
}

class Items extends GetView<HomePageControllerimp> {
  final ItemsModel itemsModel;

  const Items({
    super.key,
    required this.itemsModel,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotoproductdetails(itemsModel);
        },
        child: Card(
            color: Colors.white,
            margin: const EdgeInsets.only(right: 5, bottom: 5),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(50, 50),
                    bottomLeft: Radius.elliptical(50, 50),
                    bottomRight: Radius.elliptical(50, 50),
                    topLeft: Radius.elliptical(50, 50))),
            child: Column(
              children: [
                SizedBox(
                  height: 160,
                  width: 190,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.elliptical(30, 30),
                          topRight: Radius.elliptical(30, 30),
                          bottomLeft: Radius.elliptical(30, 30),
                          topLeft: Radius.elliptical(30, 30)),
                      child: CachedNetworkImage(
                          imageUrl:
                              "${Applink.imageitems}/${itemsModel.itemsImage}",
                          fit: BoxFit.cover)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 22,
                  width: 180,
                  margin: const EdgeInsets.only(top: 12),
                  child: Text(
                    " ${itemsModel.itemsName}",
                    style: const TextStyle(
                        fontFamily: "BebasNeue",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                /*const SizedBox(
                  height: 40,
                  width: 145,
                  child: Text(
                    "Click Here To Know About All Details . . . ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: "BebasNeue",
                        color: Colors.grey),
                  ),
                ),*/
                /*   SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Container(
                        margin: const EdgeInsets.only(left: 27),
                        child: Text(
                          "${itemsModel.itemsPrice} S.Y.P",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                              fontFamily: "BebasNeue"),
                        ),
                      ),
                    ],
                  ),
                )*/
              ],
            )));
  }
}*/
