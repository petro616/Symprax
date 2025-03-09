import 'package:Symprax/core/constant/routes.dart';
import 'package:Symprax/core/midlleware/mymidlleware.dart';
import 'package:Symprax/test.dart';
import 'package:Symprax/test_view.dart';
import 'package:Symprax/view/address/add.dart';
import 'package:Symprax/view/address/addaddressparttwo.dart';
import 'package:Symprax/view/address/view.dart';
import 'package:Symprax/view/screen/auth/forgetpassword/forgetpassowrd.dart';
import 'package:Symprax/view/screen/auth/login.dart';
import 'package:Symprax/view/screen/auth/forgetpassword/reseatpassword.dart';
import 'package:Symprax/view/screen/auth/signup.dart';
import 'package:Symprax/view/screen/auth/forgetpassword/succesreseatpassword.dart';
import 'package:Symprax/view/screen/auth/successignup.dart';
import 'package:Symprax/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:Symprax/view/screen/auth/verifycodesignup.dart';
import 'package:Symprax/view/screen/cart.dart';
import 'package:Symprax/view/screen/checkout.dart';
import 'package:Symprax/view/screen/home.dart';
import 'package:Symprax/view/screen/homescreen.dart';
import 'package:Symprax/view/screen/items_in_categories_list.dart';
import 'package:Symprax/view/screen/language.dart';
import 'package:Symprax/view/screen/myfavourite.dart';
import 'package:Symprax/view/screen/offers.dart';
import 'package:Symprax/view/screen/onboarding.dart';
import 'package:Symprax/view/screen/orders/archieve.dart';
import 'package:Symprax/view/screen/orders/details.dart';
import 'package:Symprax/view/screen/orders/pendings.dart';
import 'package:Symprax/view/screen/productdetails.dart';
import 'package:Symprax/view/screen/settings.dart';
import 'package:Symprax/view/screen/viewallcategories.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  ////////////////////////////// AUTHENTICATION /////////////////////////////////
  GetPage(name: AppRoute.signup, page: () => const Signup()),
  GetPage(
      name: AppRoute.verifycodesignup, page: () => const Verifycodesignup()),
  GetPage(name: AppRoute.succesSignUp, page: () => const Successignup()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  ////////////////////////////// FORGET PASSWORD AUTHENTICATION ///////////////////////////////
  GetPage(name: AppRoute.forgetpassowrd, page: () => const Forgetpassowrd()),
  GetPage(name: AppRoute.verifycode, page: () => const Verifycode()),
  GetPage(name: AppRoute.reseatPassword, page: () => const Reseatpassword()),
  GetPage(
      name: AppRoute.succesReseatPassword,
      page: () => const Succesreseatpassword()),
  ////////////////////////////// ON BOARDING ///////////////////////////////
  GetPage(name: AppRoute.onboarding, page: () => const Onboarding()),
  ////////////////////////////// LANGUAGE ///////////////////////////////
  GetPage(
      name: AppRoute.language,
      page: () => const Language(),
      middlewares: [Mymidlleware()]),
  ////////////////////////////// HOMESCREEN ///////////////////////////////
  GetPage(name: AppRoute.homescreen, page: () => const Homescreen()),
  ////////////////////////////// HOMEPAGE ///////////////////////////////
  GetPage(name: AppRoute.home, page: () => const home()),
  ////////////////////////////// FAVOURITE ///////////////////////////////
  GetPage(name: AppRoute.myfavourite, page: () => const Myfavourite()),
  ////////////////////////////// CART && CHECK OUT ///////////////////////////////
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  ////////////////////////////// SETTINGS ///////////////////////////////
  GetPage(name: AppRoute.settingsscreen, page: () => const SettingsScreen()),
  ////////////////////////////// CATEGORIES && ITEMS ///////////////////////////////
  GetPage(
      name: AppRoute.viewallcategories, page: () => const Viewallcategories()),
  GetPage(
      name: AppRoute.itemsInCategorieslist,
      page: () => const ItemsInCategorieslist()),
  ////////////////////////////// PRODUCT DETAILS ///////////////////////////////
  GetPage(name: AppRoute.productdetails, page: () => const Productdetails()),
  ////////////////////////////// ADDRESS ///////////////////////////////
  GetPage(name: AppRoute.viewadress, page: () => const viewaddress()),
  GetPage(name: AppRoute.addaddress, page: () => const Addaddress()),
  GetPage(
      name: AppRoute.addaddressparttwo, page: () => const Addaddressparttwo()),
  ////////////////////////////// ORDERS && ORDER DETAILS && ORDERS ARCHIVE ///////////////////////////////
  GetPage(name: AppRoute.pendingsorders, page: () => const Pendings()),
  GetPage(name: AppRoute.archieveorders, page: () => const Archieve()),
  GetPage(name: AppRoute.orderdetails, page: () => const OrderDetails()),
  ////////////////////////////// OFFERS ///////////////////////////////
  GetPage(name: AppRoute.offers, page: () => const Offers()),
  ////////////////////////////// FOR TEST ///////////////////////////////
  GetPage(name: AppRoute.test, page: () => const Test()),
  GetPage(name: AppRoute.testView, page: () => const TestView()),
];
