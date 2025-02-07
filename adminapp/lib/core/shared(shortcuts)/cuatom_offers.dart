/*import "package:adminapp/linkapi.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:cached_network_image/cached_network_image.dart';

class Customitemsoffers extends GetView<HomePageControllerimp> {
  const Customitemsoffers({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.offers.length,
          itemBuilder: (context, i) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.offers[i]),
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
                  height: 140,
                  width: 190,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.elliptical(50, 50),
                          topRight: Radius.elliptical(50, 50),
                          bottomLeft: Radius.elliptical(50, 50),
                          topLeft: Radius.elliptical(50, 50)),
                      child: CachedNetworkImage(
                          imageUrl:
                              "${Applink.imageitems}/${itemsModel.itemsImage}",
                          fit: BoxFit.cover)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 22,
                  width: 180,
                  margin: const EdgeInsets.only(top: 2),
                  child: Text(
                    "${itemsModel.itemsName}",
                    style: const TextStyle(
                        fontFamily: "BebasNeue",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
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
                ),
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
