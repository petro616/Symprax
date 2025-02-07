import 'dart:async';
import 'package:Symprax/core/class/status_request.dart';
import 'package:Symprax/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddController extends GetxController {
  requestpermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("176".tr, "175".tr);
      return Get.defaultDialog(title: "180".tr, middleText: "179".tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("176".tr, "177".tr);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("176".tr, "178".tr);
    }
  }

  double? lat;
  double? long;
  List<Marker> markers = [];
  addtomarker(LatLng latlong) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latlong));
    lat = latlong.latitude;
    long = latlong.longitude;
    update();
  }

  gotoaddadressparttwo() {
    Get.toNamed(AppRoute.addaddressparttwo, arguments: {
      "lat": lat.toString(),
      "long": long.toString(),
    });
  }

  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  CameraPosition? kGooglePlex;
  Completer<GoogleMapController>? completercontroller;

  getcurrentlocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addtomarker(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getcurrentlocation();
    requestpermission();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
