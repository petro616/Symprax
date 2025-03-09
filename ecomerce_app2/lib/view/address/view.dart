import "package:Symprax/controller/address/viewaddress_controller.dart";
import "package:Symprax/core/class/handlingdataview.dart";
import "package:Symprax/core/constant/colors.dart";
import "package:Symprax/core/constant/routes.dart";
import "package:Symprax/data/model/addressmodel.dart";
import "package:Symprax/view/widget/address/address_body.dart";
import "package:Symprax/view/widget/address/address_delete_button.dart";
import "package:Symprax/view/widget/address/address_phone.dart";
import "package:Symprax/view/widget/address/address_title.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

//ignore:camel_case_types
class viewaddress extends StatelessWidget {
  const viewaddress({super.key});
  @override
  Widget build(BuildContext context) {
    ViewaddressController addressController = Get.put(ViewaddressController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Get.toNamed(AppRoute.addaddress);
          },
          child: const Icon(
            EvaIcons.edit,
            color: Colors.blueGrey,
            size: 30,
          ),
        ),
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: Text("105".tr),
        ),
        body: GetBuilder<ViewaddressController>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: addressController.data.length,
                  itemBuilder: (context, i) {
                    return AddressView(
                      address: controller.data[i],
                      onDelete: () {
                        controller.deletedata(controller.data[i].adressId!);
                      },
                    );
                  }));
        }));
  }
}

class AddressView extends StatelessWidget {
  final Addressmodel address;
  final void Function()? onDelete;
  const AddressView({super.key, required this.address, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(50, 50),
                  topLeft: Radius.elliptical(50, 50))),
          color: AppColor.homepagecolorbackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddressTitle(title: address.adressName!),
              AddressBody(
                  body:
                      "${"106".tr}${address.adressCity!} / ${address.adressStreet!}"),
              AddressPhone(phone: "${"107".tr}${address.adressPhone!}"),
              AddressDeleteButton(text: "108".tr, onPressed: onDelete!),
            ],
          )),
    );
  }
}
