import 'package:Symprax/core/class/crud.dart';
import 'package:Symprax/linkapi.dart';

class FavouriteData {
  Crud crud;
  FavouriteData(this.crud);

  addfavourite(String usersid, String itemsid) async {
    var response = await crud.postdata(
        Applink.addfavourite, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removefavourite(String usersid, String itemsid) async {
    var response = await crud.postdata(
        Applink.deletefavourite, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
