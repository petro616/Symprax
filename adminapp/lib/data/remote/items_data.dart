import 'dart:io';
import 'package:AdminApp/core/class/crud.dart';
import 'package:AdminApp/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  viewData() async {
    var response = await crud.postdata(Applink.itemsview, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(Applink.itemsadd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postdata(Applink.itemsedit, data);
    } else {
      response =
          await crud.addRequestWithImageOne(Applink.itemsedit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postdata(Applink.itemsdelete, data);
    return response.fold((l) => l, (r) => r);
  }

  addsecondphoto(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(
        Applink.itemsaddanotherphotos, data, file, "secondphoto");
    return response.fold((l) => l, (r) => r);
  }

  addthirdphoto(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(
        Applink.itemsaddanotherphotos, data, file, "thirdphoto");
    return response.fold((l) => l, (r) => r);
  }

  getIdFromItemsData() async {
    var response = await crud.postdata(Applink.getIdFromItems, {});
    return response.fold((l) => l, (r) => r);
  }
}
