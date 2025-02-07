import 'package:Symprax/view/screen/cart.dart';
import 'package:Symprax/view/screen/home.dart';
import 'package:Symprax/view/screen/myfavourite.dart';
import 'package:Symprax/view/screen/notifications.dart';
import 'package:Symprax/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomescreenController extends GetxController {
  changepage(int currentpageindex);
}

class HomescreenControllerimp extends HomescreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    const home(),
    const Myfavourite(),
    const Cart(),
    const Notifications(),
    const SettingsScreen()
  ];

  @override
  changepage(int currentpageindex) {
    currentpage = currentpageindex;
    update();
  }
}
