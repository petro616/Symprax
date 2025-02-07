class Applink {
  static const String server = "https://repostoree.online/ecommerce";
  static const String imagestatic =
      "https://repostoree.online/ecommerce/upload";
  static const String test = "$server/test.php";
  //////////////////////( IMAGE )///////////////////////
  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";
  //////////////////////( AUTH )///////////////////////
  static const String signup = "$server/admin/auth/signup.php";
  static const String verifycode = "$server/admin/auth/verifycode.php";
  static const String login = "$server/admin/auth/login.php";
  static const String resendverify = "$server/admin/auth/resend.php";
  //////////////////////( FORGET_PASSWORD )///////////////////////
  static const String checkemail =
      "$server/admin/forgetpassword/checkemail.php";
  static const String verifycodeforgetpassword =
      "$server/admin/forgetpassword/verifycodeforgetpassword.php";
  static const String resetpassword =
      "$server/admin/forgetpassword/resetpassword.php";
  //////////////////////( ADDRESS )///////////////////////////
  static const String viewdataaddress = "$server/adress/view.php";
  static const String adddataaddress = "$server/adress/add.php";
  static const String editdataaddress = "$server/adress/edit.php";
  static const String deletedataaddress = "$server/adress/delete.php";
  //////////////////////( COUPON )///////////////////////////
  static const String checkcoupon = "$server/coupon/checkCoupon.php";
  //////////////////////( NOTIFICATIONS )///////////////////////////
  static const String notifications = "$server/notifications.php";
  //////////////////////( CATEGORIES )///////////////////////////
  static const String categoriesview = "$server/admin/categories/view.php";
  static const String categoriesadd = "$server/admin/categories/add.php";
  static const String categoriesedit = "$server/admin/categories/edit.php";
  static const String categoriesdelete = "$server/admin/categories/delete.php";
  //////////////////////( ITEMS )///////////////////////////
  static const String itemsview = "$server/admin/items/view.php";
  static const String itemsadd = "$server/admin/items/add.php";
  static const String itemsaddanotherphotos =
      "$server/admin/items/add_another_photos.php";
  static const String itemsedit = "$server/admin/items/edit.php";
  static const String itemsdelete = "$server/admin/items/delete.php";
  static const String getIdFromItems =
      "$server/admin/items/get_id_fromi_items.php";
  //////////////////////( ORDERS )///////////////////////////
  static const String approveOrder = "$server/admin/orders/approve.php";
  static const String prepareOrder = "$server/admin/orders/prepare.php";
  static const String viewPendingOrder = "$server/admin/orders/viewpending.php";
  static const String viewAcceptedOrder =
      "$server/admin/orders/viewaccepted.php";
  static const String viewDetailsOrder = "$server/admin/orders/details.php";
  static const String viewArchieveOrder = "$server/admin/orders/archieve.php";
}
