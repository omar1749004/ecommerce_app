class ItemsModel {
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
  String ?cName;
  int favorite ;
  String itemPriceDiscound;

  ItemsModel(
      {
        required this.favorite,
        required this.cName,
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
         required this.itemPriceDiscound,
         
         });

factory ItemsModel.fromjsone(Map<String, dynamic> json)
  {
   
    return ItemsModel(
    favorite: json["favorite"] ==null ?0 :json["favorite"],
    cName :json["categories_name"],
    itemId : json['item_id'],
    itemName : json['item_name'],
    itemNameAr : json['item_name_ar'],
    itemDesc : json['item_desc'],
   itemPriceDiscound : json['item_PriceDiscound'].toString(),
    itemDescAr : json['item_desc_ar'],
    itemImage : json['item_image'],
    itemsCount : json['items_count'],
    itemActive : json['item_active'],
    itemPrice : json['item_price'],
    itemDescound : json['item_descound'],
    itemDate : json['item_date'],
    itemC : json['item_c'],
    
    );
   
    
  }
}