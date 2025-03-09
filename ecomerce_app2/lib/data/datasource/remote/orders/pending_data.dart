import 'package:Symprax/core/class/crud.dart';
import 'package:Symprax/linkapi.dart';

class PendingData {
  Crud crud;
  PendingData(this.crud);

  getdata(String id) async {
    var response = await crud.postdata(Applink.pendingsorders, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String orderid) async {
    var response = await crud.postdata(Applink.orderdelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
