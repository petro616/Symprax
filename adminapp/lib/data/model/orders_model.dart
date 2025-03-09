class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersType;
  String? ordersAddress;
  String? ordersShipingprice;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String? ordersRating;
  String? ordersNoterating;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? ordersDatetime;
  String? adressId;
  String? adressUsersid;
  String? adressName;
  String? adressCity;
  String? adressStreet;
  String? adressPhone;
  String? adressLat;
  String? adressLong;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersType,
      this.ordersAddress,
      this.ordersShipingprice,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersRating,
      this.ordersNoterating,
      this.ordersPaymentmethod,
      this.ordersStatus,
      this.ordersDatetime,
      this.adressId,
      this.adressUsersid,
      this.adressName,
      this.adressCity,
      this.adressStreet,
      this.adressPhone,
      this.adressLat,
      this.adressLong});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersType = json['orders_type'];
    ordersAddress = json['orders_address'];
    ordersShipingprice = json['orders_shipingprice'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders-rating'];
    ordersNoterating = json['orders_noterating'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    adressId = json['adress_id'];
    adressUsersid = json['adress_usersid'];
    adressName = json['adress_name'];
    adressCity = json['adress_city'];
    adressStreet = json['adress_street'];
    adressPhone = json['adress_phone'];
    adressLat = json['adress_lat'];
    adressLong = json['adress_long'];
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_type'] = this.ordersType;
    data['orders_address'] = this.ordersAddress;
    data['orders_shipingprice'] = this.ordersShipingprice;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders-rating'] = this.ordersRating;
    data['orders_noterating'] = this.ordersNoterating;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_datetime'] = this.ordersDatetime;
    data['adress_id'] = this.adressId;
    data['adress_usersid'] = this.adressUsersid;
    data['adress_name'] = this.adressName;
    data['adress_city'] = this.adressCity;
    data['adress_street'] = this.adressStreet;
    data['adress_phone'] = this.adressPhone;
    data['adress_lat'] = this.adressLat;
    data['adress_long'] = this.adressLong;
    return data;
  }*/
}
