import 'package:AdminApp/core/class/crud.dart';
import 'package:AdminApp/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String email, String password) async {
    var response = await crud
        .postdata(Applink.login, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
