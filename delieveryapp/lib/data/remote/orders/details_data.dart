import 'package:DelieveryApp/core/class/crud.dart';
import 'package:DelieveryApp/linkapi.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);

  getdata(String id) async {
    var response = await crud.postdata(Applink.detailsOrders, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
