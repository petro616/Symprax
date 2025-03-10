import 'package:DelieveryApp/core/class/crud.dart';
import 'package:DelieveryApp/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username, String email, String password, String phone) async {
    var response = await crud.postdata(Applink.signup, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
