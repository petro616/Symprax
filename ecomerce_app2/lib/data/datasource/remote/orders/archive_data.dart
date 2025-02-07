import 'package:Symprax/core/class/crud.dart';
import 'package:Symprax/linkapi.dart';

class ArchiveData {
  Crud crud;
  ArchiveData(this.crud);

  getdata(String id) async {
    var response = await crud.postdata(Applink.orderarchive, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  ratingdata(String id, String rating, String comment) async {
    var response = await crud.postdata(Applink.rating, {
      "id": id,
      "comment": comment,
      "rating": rating,
    });
    return response.fold((l) => l, (r) => r);
  }
}
