class OrdersModels {
  int ordersId;
  int ordersUsersid;
  int ordersAddress;
  int ordersType;
  int ordersPricedelivery;
  int ordersPrice;
  int ordersTotalprice;
  int ordersCoupon;
  String ordersDate;
  int ordersPaymentmethod;
  int ordersStatuse;

  OrdersModels(
      {required this.ordersId,
     required this.ordersUsersid,
     required this.ordersAddress,
     required this.ordersType,
     required this.ordersPricedelivery,
     required this.ordersPrice,
     required this.ordersTotalprice,
     required this.ordersCoupon,
     required this.ordersDate,
     required this.ordersPaymentmethod,
     required this.ordersStatuse});

  factory OrdersModels.fromJson(Map<String, dynamic> json) {

   return OrdersModels(
     ordersId : json['orders_id'],
    ordersUsersid : json['orders_usersid'],
    ordersAddress : json['orders_address'],
    ordersType : json['orders_type'],
    ordersPricedelivery : json['orders_pricedelivery'],
    ordersPrice : json['orders_price'],
    ordersTotalprice : json['orders_totalprice'],
    ordersCoupon : json['orders_coupon'],
    ordersDate : json['orders_date'],
    ordersPaymentmethod : json['orders_paymentmethod'],
    ordersStatuse : json['orders_statuse'],
   );
  }
}