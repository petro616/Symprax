import 'package:Symprax/core/class/crud.dart';
import 'package:Symprax/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);

  getdatacategories() async {
    var response = await crud.postdata(Applink.categories, {});
    return response.fold((l) => l, (r) => r);
  }
}
