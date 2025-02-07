import 'package:DelieveryApp/core/class/crud.dart';
import 'package:DelieveryApp/linkapi.dart';

class ArchiveData {
  Crud crud;
  ArchiveData(this.crud);

  getdata(String delieveryid) async {
    var response =
        await crud.postdata(Applink.archieveOrders, {"id": delieveryid});
    return response.fold((l) => l, (r) => r);
  }
}
