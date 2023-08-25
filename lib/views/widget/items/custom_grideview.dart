import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/favorit_controller.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Items_controller.dart';
import '../../../core/functions/translate_database.dart';
import '../../../link_api.dart';

class CustomGridView extends GetView<ItemsControllerImp> {
  const CustomGridView({ super.key,required this.itemModel});
  final ItemsModel itemModel;
  
  @override
  Widget build(BuildContext context) {
     
   return 
           InkWell(
            onTap: (){
              controller.gotoProductDetails(itemModel);
            },
            child: Stack(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: itemModel.itemId,
                            child: CachedNetworkImage(
                                height: 130, imageUrl: "${linkImageUpload}/${itemModel.itemImage}"),
                          ),
                          Text(translateDataBase(itemModel.itemNameAr,itemModel.itemName),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Text("Rating 3.5",style: TextStyle(color: Colors.grey[900]),),
                          Row(children: [...List.generate(5, (index) => Icon(Icons.star_rate,size:15,))
                        ]),]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${itemModel.itemPriceDiscound} \$",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                             GetBuilder<FavoriteControllerImp>(builder: (controller)=> IconButton(
                                  onPressed: () {
                                    
                                   
                                    if(controller.isFavorite[itemModel.itemId]== 0)
                                    {
                                       
                                      controller.addFavorite(itemModel.itemId.toString());
                                      controller.setFavorite(itemModel.itemId, 1);
                                    }
                                    else{
                                      controller.deletefavorite(itemModel.itemId.toString());
                                      controller.setFavorite(itemModel.itemId, 0);
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemModel.itemId] == 0?
                                    Icons.favorite_border_outlined
                                    : Icons.favorite,
                                    color:controller.isFavorite[itemModel.itemId] == 0?
                                     Colors.black:Colors.red,
                                    )))
                            ],
                          )
                        ]),
                  ),
                ),
                if(itemModel.itemDescound !=0)
                  Positioned(
                  top: 4,
                  left: 4,
                  child: Image.asset(ImageAsset.sale,width: 50,))
                
              ],
             
            ),
          );
       
  }
}
