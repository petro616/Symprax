import 'package:DelieveryApp/core/constant/routes.dart';
import 'package:DelieveryApp/core/midlleware/mymidlleware.dart';
import 'package:DelieveryApp/view/screen/home.dart';
import 'package:DelieveryApp/view/screen/auth/forgetpassword/forgetpassowrd.dart';
import 'package:DelieveryApp/view/screen/auth/forgetpassword/reseatpassword.dart';
import 'package:DelieveryApp/view/screen/auth/forgetpassword/succesreseatpassword.dart';
import 'package:DelieveryApp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:DelieveryApp/view/screen/auth/login.dart';
import 'package:DelieveryApp/view/screen/auth/signup.dart';
import 'package:DelieveryApp/view/screen/auth/successignup.dart';
import 'package:DelieveryApp/view/screen/auth/verifycodesignup.dart';
import 'package:DelieveryApp/view/screen/homescreen.dart';
import 'package:DelieveryApp/view/screen/orders/details.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  ////////////////////////////// AUTHENTICATION /////////////////////////////////
  GetPage(name: AppRoute.signup, page: () => const Signup()),
  GetPage(
      name: AppRoute.verifycodesignup, page: () => const Verifycodesignup()),
  GetPage(name: AppRoute.succesSignUp, page: () => const Successignup()),
  GetPage(
      name: AppRoute.login,
      page: () => const Login(),
      middlewares: [Mymidlleware()]),
  ////////////////////////////// FORGET PASSWORD AUTHENTICATION ///////////////////////////////
  GetPage(name: AppRoute.forgetpassowrd, page: () => const Forgetpassowrd()),
  GetPage(name: AppRoute.verifycode, page: () => const Verifycode()),
  GetPage(name: AppRoute.reseatPassword, page: () => const Reseatpassword()),
  GetPage(
      name: AppRoute.succesReseatPassword,
      page: () => const Succesreseatpassword()),
  ////////////////////////////// ON BOARDING ///////////////////////////////
  // GetPage(name: AppRoute.onboarding, page: () => const Onboarding()),
  ////////////////////////////// LANGUAGE ///////////////////////////////
  /* GetPage(
      name: AppRoute.language,
      page: () => const Language(),
      middlewares: [Mymidlleware()]),*/
  ////////////////////////////// HOMESCREEN ///////////////////////////////
  GetPage(name: AppRoute.homescreen, page: () => const Homescreen()),
  ////////////////////////////// HOMEPAGE ///////////////////////////////
  GetPage(name: AppRoute.home, page: () => const Home()),
  ////////////////////////////// FAVOURITE ///////////////////////////////
  // GetPage(name: AppRoute.myfavourite, page: () => const Myfavourite()),
  ////////////////////////////// CART && CHECK OUT ///////////////////////////////
  // GetPage(name: AppRoute.cart, page: () => const Cart()),
  // GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  ////////////////////////////// SETTINGS ///////////////////////////////
  // GetPage(name: AppRoute.settingsscreen, page: () => const SettingsScreen()),
  ////////////////////////////// CATEGORIES && ITEMS ///////////////////////////////
  /*GetPage(
      name: AppRoute.viewallcategories, page: () => const Viewallcategories()),*/
  /*GetPage(
      name: AppRoute.itemsCategorieslist,
      page: () => const ItemsCategorieslist()),*/
  ////////////////////////////// PRODUCT DETAILS ///////////////////////////////
  //GetPage(name: AppRoute.productdetails, page: () => const Productdetails()),
  ////////////////////////////// ADDRESS ///////////////////////////////
  // GetPage(name: AppRoute.viewadress, page: () => const viewaddress()),
  // GetPage(name: AppRoute.addaddress, page: () => const Addaddress()),
  /*GetPage(
      name: AppRoute.addaddressparttwo, page: () => const Addaddressparttwo()),*/
  ////////////////////////////// ORDERS && ORDER DETAILS && ORDERS ARCHIVE ///////////////////////////////
  // GetPage(name: AppRoute.pendingsorders, page: () => const Pendings()),
  //GetPage(name: AppRoute.archieveorders, page: () => const Archieve()),
  GetPage(name: AppRoute.orderdetails, page: () => const OrderDetails()),
  ////////////////////////////// OFFERS ///////////////////////////////
  // GetPage(name: AppRoute.offers, page: () => const Offers()),
  ////////////////////////////// FOR TEST ///////////////////////////////
  // GetPage(name: AppRoute.test, page: () => const Test()),
  //GetPage(name: AppRoute.testView, page: () => const TestView()),
];
