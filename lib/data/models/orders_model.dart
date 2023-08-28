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
   int? addressid;
  String? name;
  String? city;
  String? street;
  double? lat;
  double? long;

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
     required this.ordersStatuse,
      this.addressid,
       this.name,
       this.city,
       this.street,
       this.lat,
       this.long,
     });

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
    addressid: json["address_id"],
       name: json["address_name"],
        city: json["address_city"],
        street: json["address_street"],
        lat: json["address_lat"],
        long: json["address_long"],
   );
  }
}