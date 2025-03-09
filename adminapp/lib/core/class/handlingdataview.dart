import "package:AdminApp/core/class/status_request.dart";
import "package:AdminApp/core/constant/imageasset.dart";
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "package:get/get.dart";
import "package:lottie/lottie.dart";

class Handlingdataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handlingdataview(
      {super.key, required this.statusRequest, required this.widget});
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: SpinKitSpinningLines(
              itemCount: 15,
              lineWidth: 15,
              color: Colors.white,
              size: 130.0,
            ),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 150, height: 150))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.serverfailure,
                        width: 200, height: 200))
                : statusRequest == StatusRequest.failure
                    ? Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(70),
                                  bottomLeft: Radius.circular(70)),
                              color: Color.fromARGB(255, 223, 177, 104),
                            ),
                            height: 300,
                            width: Get.width,
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 25, left: 40),
                              child: Lottie.asset(AppImageAsset.failure,
                                  width: 320, height: 320)),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "N O T H I N G - H E R E - Y E T",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    : widget;
  }
}

class Handlingdatarequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handlingdatarequest(
      {super.key, required this.statusRequest, required this.widget});
  @override
  Widget build(BuildContext context) {
    // Get.put(HomePageControllerimp());
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: SpinKitSpinningLines(
              itemCount: 15,
              lineWidth: 15,
              color: Colors.white,
              size: 130.0,
            ),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Container(
                margin: EdgeInsets.only(top: Get.width / 5),
                child: Center(
                    child: Lottie.asset(AppImageAsset.offline,
                        width: 150, height: 150)),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Container(
                    margin: EdgeInsets.only(top: Get.width / 5),
                    child: Center(
                        child: Lottie.asset(AppImageAsset.serverfailure,
                            width: 250, height: 250)),
                  )
                : widget;
  }
}
