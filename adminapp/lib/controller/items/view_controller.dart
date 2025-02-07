import 'package:AdminApp/core/class/status_request.dart';
import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/data/model/itemsmodel.dart';
import 'package:AdminApp/data/remote/items_data.dart';
import 'package:get/get.dart';
import '../../core/function/handlingdatacontroller.dart';

abstract class ItemsViewController extends GetxController {
  view();
}

class ItemsViewControllerimp extends ItemsViewController {
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsdata = ItemsData(Get.find());
  List<ItemsModel> data = [];
  @override
  view() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsdata.viewData();
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response["data"];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteitems(String id, String imagename, String imagetwo, String imagethree) {
    itemsdata.deleteData({
      "itemsid": id,
      "imagename": imagename,
      "imagetwo": imagetwo,
      "imagethree": imagethree
    });
    data.removeWhere((element) => element.itemsId == id);
    update();
  }

  goToEditCategory(ItemsModel itemsmodel) {
    Get.toNamed(AppRoute.itemsedit, arguments: {"itemsmodel": itemsmodel});
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
