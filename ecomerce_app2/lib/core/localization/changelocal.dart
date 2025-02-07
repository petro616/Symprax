import 'package:Symprax/core/constant/apptheme.dart';
import 'package:Symprax/core/function/fcmconfig.dart';
import 'package:Symprax/core/services/servisess.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  late ThemeData apptheme = themeEnglish;
  MyServices myServices = Get.find();
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    apptheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }

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

  @override
  void onInit() {
    requestPermisionNotification();
    fcmconfig();
    requestpermission();
    String? sharePrefLang = myServices.sharedPreferences.getString("lang");
    if (sharePrefLang == "ar") {
      language = const Locale("ar");
      apptheme = themeArabic;
    } else if (sharePrefLang == "en") {
      language = const Locale("en");
      apptheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = themeEnglish;
    }
    super.onInit();
  }
}
