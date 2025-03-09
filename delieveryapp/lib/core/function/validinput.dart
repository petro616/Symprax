import 'package:get/get.dart';

validinput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "field is empty";
  }
  if (type == "username") {
    // This regex allows letters, numbers, and spaces for usernames
    final RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9 ]+$');
    if (!usernameRegExp.hasMatch(val)) {
      return "Username should contain only letters, numbers, and spaces";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "enter your phone number";
    }
  }

  if (val.length < min) {
    return "insert more than $min letters";
  }
  if (val.length > max) {
    return "insert less than $max letters";
  }
}
/*if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "username should be letters and numbers";
    }
  }*/
