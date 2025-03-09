import 'package:AdminApp/core/constant/routes.dart';
import 'package:AdminApp/core/midlleware/mymidlleware.dart';
import 'package:AdminApp/view/screen/auth/forgetpassword/forgetpassowrd.dart';
import 'package:AdminApp/view/screen/auth/forgetpassword/reseatpassword.dart';
import 'package:AdminApp/view/screen/auth/forgetpassword/succesreseatpassword.dart';
import 'package:AdminApp/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:AdminApp/view/screen/auth/login.dart';
import 'package:AdminApp/view/screen/auth/signup.dart';
import 'package:AdminApp/view/screen/auth/successignup.dart';
import 'package:AdminApp/view/screen/auth/verifycodesignup.dart';
import 'package:AdminApp/view/screen/categories/add.dart';
import 'package:AdminApp/view/screen/categories/edit.dart';
import 'package:AdminApp/view/screen/categories/view.dart';
import 'package:AdminApp/view/screen/home.dart';
import 'package:AdminApp/view/screen/items/add.dart';
import 'package:AdminApp/view/screen/items/add_morephotos.dart';
import 'package:AdminApp/view/screen/items/edit.dart';
import 'package:AdminApp/view/screen/items/view.dart';
import 'package:AdminApp/view/screen/orders/accepted.dart';
import 'package:AdminApp/view/screen/orders/archieve.dart';
import 'package:AdminApp/view/screen/orders/details.dart';
import 'package:AdminApp/view/screen/orders/order_screen.dart';
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
  ////////////////////////////// CATEGORIES ///////////////////////////////
  GetPage(name: AppRoute.categoriesview, page: () => const Categoriesview()),
  GetPage(name: AppRoute.categoriesadd, page: () => const Categoriesadd()),
  GetPage(name: AppRoute.categoriesedit, page: () => const Categoriesedit()),
  ////////////////////////////// ITEMS ///////////////////////////////
  GetPage(name: AppRoute.itemsview, page: () => const Itemsview()),
  GetPage(name: AppRoute.itemsadd, page: () => const Itemsadd()),
  GetPage(name: AppRoute.itemsedit, page: () => const Itemsedit()),
  GetPage(name: AppRoute.itemsaddmorephotos, page: () => const AddMorephotos()),
  ////////////////////////////// ON BOARDING ///////////////////////////////
  // GetPage(name: AppRoute.onboarding, page: () => const Onboarding()),
  ////////////////////////////// LANGUAGE ///////////////////////////////
  /* GetPage(
      name: AppRoute.language,
      page: () => const Language(),
      middlewares: [Mymidlleware()]),*/
  ////////////////////////////// HOMESCREEN ///////////////////////////////
  GetPage(name: AppRoute.orderscreen, page: () => const Orderscreen()),
  ////////////////////////////// HOMEPAGE ///////////////////////////////
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),
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
  GetPage(name: AppRoute.orderaccepted, page: () => const Accepted()),
  GetPage(name: AppRoute.archieveorders, page: () => const Archieve()),
  ////////////////////////////// OFFERS ///////////////////////////////
  // GetPage(name: AppRoute.offers, page: () => const Offers()),
  ////////////////////////////// FOR TEST ///////////////////////////////
  // GetPage(name: AppRoute.test, page: () => const Test()),
  //GetPage(name: AppRoute.testView, page: () => const TestView()),
];
