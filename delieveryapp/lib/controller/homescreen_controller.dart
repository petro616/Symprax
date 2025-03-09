import 'package:DelieveryApp/view/screen/orders/accepted.dart';
import 'package:DelieveryApp/view/screen/orders/pendings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomescreenController extends GetxController {
  changepage(int currentpageindex);
}

class HomescreenControllerimp extends HomescreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    const Pendings(),
    Accepted(),
  ];

  @override
  changepage(int currentpageindex) {
    currentpage = currentpageindex;
    update();
  }
}
