import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/myfavorite_controller.dart';
import 'package:e_commerce_app/data/models/myfavorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/functions/translate_database.dart';
import '../../../link_api.dart';

class CustomFavoriteGridView extends GetView<MyFavoritControllerImp> {
  const CustomFavoriteGridView({ super.key,required this.myFavoriteModel});
  final MyFavoriteModel myFavoriteModel;
  
  @override
  Widget build(BuildContext context) {
     
   return 
           InkWell(
            onTap: (){
              //controller.gotoProductDetails(itemModel);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: myFavoriteModel.itemId,
                        child: CachedNetworkImage(
                            height: 130, imageUrl: "${linkImageUpload}/${myFavoriteModel.itemImage}"),
                      ),
                      Text(translateDataBase(myFavoriteModel.itemNameAr,myFavoriteModel.itemName),
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
                    SizedBox(
                        height:10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${myFavoriteModel.itemPrice} \$",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                controller.deletData(myFavoriteModel.favorite_id.toString());
                              },icon: Icon(
                              Icons.delete
                              ),
                              )
                              
                               
                      
                        ],
                      )
                    ]),
              ),
            ),
          );
       
  }
}
