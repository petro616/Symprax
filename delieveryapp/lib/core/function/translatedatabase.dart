import 'package:DelieveryApp/core/services/servisess.dart';
import 'package:get/get.dart';

translatedatabase(columnar, columnen) {
  MyServices myservices = Get.find();
  if (myservices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
