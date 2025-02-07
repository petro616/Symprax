import "package:Symprax/controller/address/add_controller.dart";
import "package:Symprax/core/class/handlingdataview.dart";
import "package:Symprax/core/constant/colors.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";

//ignore:camel_case_types
class Addaddress extends StatelessWidget {
  const Addaddress({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddController());
    return Scaffold(
      backgroundColor: AppColor.colorscaffoldLogin,
      appBar: AppBar(title: Text("119".tr)),
      body: GetBuilder<AddController>(builder: (controllerpage) {
        return Handlingdataview(
            statusRequest: controllerpage.statusRequest,
            widget: Column(
              children: [
                if (controllerpage.kGooglePlex != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          markers: controllerpage.markers.toSet(),
                          onTap: (latlong) {
                            controllerpage.addtomarker(latlong);
                          },
                          mapType: MapType.normal,
                          initialCameraPosition: controllerpage.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllermap) {
                            controllerpage.completercontroller!
                                .complete(controllermap);
                          },
                        ),
                        Positioned(
                            bottom: 5,
                            child: MaterialButton(
                              minWidth: 200.w,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              onPressed: () {
                                controllerpage.gotoaddadressparttwo();
                              },
                              color: Color.fromARGB(255, 223, 177, 104),
                              child: Text(
                                "120".tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    ),
                  )
              ],
            ));
      }),
    );
  }
}
