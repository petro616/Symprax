import 'package:Symprax/core/class/crud.dart';
import 'package:Symprax/linkapi.dart';

class NotificationsData {
  Crud crud;
  NotificationsData(this.crud);

  getdata(String usersid) async {
    var response =
        await crud.postdata(Applink.notifications, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
