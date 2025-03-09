import 'package:DelieveryApp/core/class/crud.dart';
import 'package:DelieveryApp/linkapi.dart';

class CheckemailData {
  Crud crud;
  CheckemailData(this.crud);
  postData(String email) async {
    var response = await crud.postdata(Applink.checkemail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
