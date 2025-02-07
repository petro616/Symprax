import 'package:get/get.dart';

validinput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "165".tr;
  }
  if (type == "username") {
    // This regex allows letters, numbers, spaces, and Arabic characters for usernames
    final RegExp usernameRegExp =
        RegExp(r'^[a-zA-Z0-9א-تى\s]+$|^[\u0600-\u06FF\s]+$');
    if (!usernameRegExp.hasMatch(val)) {
      return "166".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "167".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "168".tr;
    }
  }

  if (val.length < min) {
    return "${"169".tr} $min ${"171".tr}";
  }
  if (val.length > max) {
    return "${"170".tr} $max ${"171".tr}";
  }
}
/*if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "username should be letters and numbers";
    }
  }*/
