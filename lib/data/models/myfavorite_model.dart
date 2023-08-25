class MyFavoriteModel {
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

  int favorite_id;
  int favorite_usersid;
  int favorite_itemid;
      

  MyFavoriteModel(
      {

       required this.favorite_id,
        required this.itemId,
    required  this.itemName,
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
    required this.favorite_itemid,
    required this.favorite_usersid

     });



     factory MyFavoriteModel.fromjsone(Map<String, dynamic> json)
  {
   
    return MyFavoriteModel(
    favorite_id: json['favorite_id'],
    itemId : json['item_id'],
    itemName : json['item_name'],
    itemNameAr : json['item_name_ar'],
    itemDesc : json['item_desc'],
    itemDescAr : json['item_desc_ar'],
    itemImage : json['item_image'],
    itemsCount : json['items_count'],
    itemActive : json['item_active'],
    itemPrice : json['item_price'],
    itemDescound : json['item_descound'],
    itemDate : json['item_date'],
    itemC : json['item_c'],
    favorite_itemid :json['favorite_itemid'],
    favorite_usersid : json['favorite_usersid']
    );
   
    
  }
}