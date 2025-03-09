import 'package:AdminApp/core/class/crud.dart';
import 'package:AdminApp/linkapi.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);

  getdata(String id) async {
    var response = await crud.postdata(Applink.viewDetailsOrder, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
