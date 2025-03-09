import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/core/services/servisess.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myservices = Get.find();
  logout() {
    String userid = myservices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myservices.sharedPreferences.clear();
    Get.offNamed(AppRoute.language);
  }
}
