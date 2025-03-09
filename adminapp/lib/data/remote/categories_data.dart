import 'dart:io';
import 'package:AdminApp/core/class/crud.dart';
import 'package:AdminApp/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  viewData() async {
    var response = await crud.postdata(Applink.categoriesview, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(Applink.categoriesadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postdata(Applink.categoriesedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(Applink.categoriesedit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postdata(Applink.categoriesdelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
