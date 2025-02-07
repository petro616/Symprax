import 'package:AdminApp/core/class/crud.dart';
import 'package:AdminApp/linkapi.dart';

class ArchiveData {
  Crud crud;
  ArchiveData(this.crud);

  getdata() async {
    var response = await crud.postdata(Applink.viewArchieveOrder, {});
    return response.fold((l) => l, (r) => r);
  }
}
