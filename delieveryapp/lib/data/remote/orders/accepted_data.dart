import 'package:DelieveryApp/core/class/crud.dart';
import 'package:DelieveryApp/linkapi.dart';

class AcceptedData {
  Crud crud;
  AcceptedData(this.crud);

  getdata(String delieveryid) async {
    var response =
        await crud.postdata(Applink.viewacceptedOrders, {"id": delieveryid});
    return response.fold((l) => l, (r) => r);
  }

  donedata(String ordersid, String usersid) async {
    var response = await crud.postdata(
        Applink.doneOrders, {"ordersid": ordersid, "usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
