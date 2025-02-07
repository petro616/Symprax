import 'package:AdminApp/core/class/crud.dart';
import 'package:AdminApp/linkapi.dart';

class PendingData {
  Crud crud;
  PendingData(this.crud);

  getdata() async {
    var response = await crud.postdata(Applink.viewPendingOrder, {});
    return response.fold((l) => l, (r) => r);
  }

  approvedata(String ordersid, String usersid) async {
    var response = await crud.postdata(
        Applink.approveOrder, {"ordersid": ordersid, "usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
