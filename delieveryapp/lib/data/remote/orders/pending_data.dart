import 'package:DelieveryApp/core/class/crud.dart';
import 'package:DelieveryApp/linkapi.dart';

class PendingData {
  Crud crud;
  PendingData(this.crud);

  getdata() async {
    var response = await crud.postdata(Applink.pendingsOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approvedata(String ordersid, String usersid, String delieveryid) async {
    var response = await crud.postdata(Applink.approveOrders,
        {"ordersid": ordersid, "usersid": usersid, "delieveryid": delieveryid});
    return response.fold((l) => l, (r) => r);
  }
}
