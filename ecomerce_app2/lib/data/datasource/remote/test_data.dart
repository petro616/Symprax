import 'package:Symprax/core/class/crud.dart';
import 'package:Symprax/linkapi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getdata() async {
    var response = await crud.postdata(Applink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
