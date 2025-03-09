import 'package:AdminApp/view/screen/orders/accepted.dart';
import 'package:AdminApp/view/screen/orders/archieve.dart';
import 'package:AdminApp/view/screen/orders/pendings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderscreenController extends GetxController {
  changepage(int currentpageindex);
}

class OrderscreenControllerimp extends OrderscreenController {
  int currentpage = 0;
  List<Widget> listpage = [const Pendings(), const Accepted(), Archieve()];

  @override
  changepage(int currentpageindex) {
    currentpage = currentpageindex;
    update();
  }
}
