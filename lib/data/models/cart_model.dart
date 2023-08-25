class CartModel {
  int itemId;
  String itemName;
  String itemNameAr;
  String itemDesc;
  String itemDescAr;
  String itemImage;
  int itemsCount;
  int itemActive;
  int itemPrice;
  int itemDescound;
  String itemDate;
  int itemC;

  int cartid;
  int cartuserid;
  int cartitemsid;

  CartModel(
      {
 
      required this.itemId,
      required this.itemName,
      required this.itemNameAr,
      required this.itemDesc,
      required this.itemDescAr,
      required this.itemImage,
      required this.itemsCount,
      required this.itemActive,
      required this.itemPrice,
      required this.itemDescound,
      required this.itemDate,
      required this.itemC,
      required this.cartid,
      required this.cartitemsid,
      required this.cartuserid
      });

  factory CartModel.fromjsone(Map<String, dynamic> json) {
    return CartModel(
      
      
      itemId: json['item_id'],
      itemName: json['item_name'],
      itemNameAr: json['item_name_ar'],
      itemDesc: json['item_desc'],
      itemDescAr: json['item_desc_ar'],
      itemImage: json['item_image'],
      itemsCount: json['itemcount'],
      itemActive: json['item_active'],
      itemPrice: json['itemprice'],
      itemDescound: json['item_descound'],
      itemDate: json['item_date'],
      itemC: json['item_c'],
      cartid:json['cart_id'],
      cartitemsid: json['cart_userid'],
      cartuserid: json['cart_itemsid'],
    );
  }
}

  

