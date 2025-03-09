import 'package:DelieveryApp/core/class/crud.dart';
import 'package:get/get.dart';

class Initialbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
