class Applink {
  static const String server = "https://repostoree.online/ecommerce";
  static const String imagestatic =
      "https://repostoree.online/ecommerce/upload";
  static const String test = "$server/test.php";
  //////////////////////( IMAGE )///////////////////////
  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";
  //////////////////////( AUTH )///////////////////////
  static const String signup = "$server/delieveryapp/auth/signup.php";
  static const String verifycode = "$server/delieveryapp/auth/verifycode.php";
  static const String login = "$server/delieveryapp/auth/login.php";
  static const String resendverify = "$server/delieveryapp/auth/resend.php";
  //////////////////////( FORGET_PASSWORD )///////////////////////
  static const String checkemail =
      "$server/delieveryapp/forgetpassword/checkemail.php";
  static const String verifycodeforgetpassword =
      "$server/delieveryapp/forgetpassword/verifycodeforgetpassword.php";
  static const String resetpassword =
      "$server/delieveryapp/forgetpassword/resetpassword.php";
  //////////////////////( ADDRESS )///////////////////////////
  static const String viewdataaddress = "$server/adress/view.php";
  static const String adddataaddress = "$server/adress/add.php";
  static const String editdataaddress = "$server/adress/edit.php";
  static const String deletedataaddress = "$server/adress/delete.php";
  //////////////////////( COUPON )///////////////////////////
  static const String checkcoupon = "$server/coupon/checkCoupon.php";
  //////////////////////( CHECK OUT )///////////////////////////
  static const String viewacceptedOrders =
      "$server/delieveryapp/orders/accepted.php";
  static const String pendingsOrders =
      "$server/delieveryapp/orders/pendings.php";
  static const String archieveOrders =
      "$server/delieveryapp/orders/archieve.php";
  static const String detailsOrders = "$server/delieveryapp/orders/details.php";
  static const String approveOrders = "$server/delieveryapp/orders/approve.php";
  static const String doneOrders = "$server/delieveryapp/orders/done.php";
  //////////////////////( NOTIFICATIONS )///////////////////////////
  static const String notifications = "$server/notifications.php";
}
