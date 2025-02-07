import 'package:AdminApp/core/class/status_request.dart';
import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/data/model/categoriesmodel.dart';
import 'package:AdminApp/data/remote/categories_data.dart';
import 'package:get/get.dart';
import '../../core/function/handlingdatacontroller.dart';

abstract class CategoriesViewController extends GetxController {
  view();
}

class CategoriesViewControllerimp extends CategoriesViewController {
  StatusRequest statusRequest = StatusRequest.none;
  CategoriesData categoriesdata = CategoriesData(Get.find());
  List<CategoriesModel> data = [];
  @override
  view() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesdata.viewData();
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response["data"];
        data.addAll(listdata.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(String id, String imagename) {
    categoriesdata.deleteData({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }

  goToEditCategory(CategoriesModel categoriesmodel) {
    Get.toNamed(AppRoute.categoriesedit,
        arguments: {"categorymodel": categoriesmodel});
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
