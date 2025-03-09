import 'package:AdminApp/core/class/crud.dart';
import 'package:AdminApp/linkapi.dart';

class AcceptedData {
  Crud crud;
  AcceptedData(this.crud);

  getdata() async {
    var response = await crud.postdata(Applink.viewAcceptedOrder, {});
    return response.fold((l) => l, (r) => r);
  }

  doneprepareData(String ordersid, String usersid) async {
    var response = await crud.postdata(
        Applink.prepareOrder, {"ordersid": ordersid, "usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
