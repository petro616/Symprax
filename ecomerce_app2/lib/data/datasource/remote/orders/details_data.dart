import 'package:Symprax/core/class/crud.dart';
import 'package:Symprax/linkapi.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);

  getdata(String id) async {
    var response = await crud.postdata(Applink.orderdetails, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
