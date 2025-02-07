import 'package:Symprax/core/class/crud.dart';
import 'package:Symprax/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  getdata(Map data) async {
    var response = await crud.postdata(Applink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
