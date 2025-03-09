import 'package:Symprax/core/class/crud.dart';
import 'package:Symprax/linkapi.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);

  getdata() async {
    var response = await crud.postdata(Applink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
