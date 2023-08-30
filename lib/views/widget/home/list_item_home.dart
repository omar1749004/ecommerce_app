import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../link_api.dart';

class ListItemHome extends GetView<HomeContrllerImp> {
  const ListItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 160,
             child: ListView.builder(
              itemCount: controller.items.length,
              scrollDirection: Axis.horizontal, //scroll horizantle
              itemBuilder: (context , index){
                return  ItemHome(items:
                 //ItemsModel.fromjsone(controller.items[index])
                controller.items[index] ,);
              }
  ),);
  }
}

class ItemHome extends GetView<HomeContrllerImp> {
  const ItemHome({super.key, required this.items});
   final ItemsModel items;
  @override
  Widget build(BuildContext context) {
    return
             InkWell(
            onTap: (){
              controller.gotoProductDetails(items);
            },
            child: Stack(
                  children: [
                   Container(
                    padding: EdgeInsets.symmetric(horizontal:20),
                    child:  Image.network(
                    
                    "$linkImageUpload/${items.itemImage}",
                   height: 120,
                   width: 200,
                   fit: BoxFit.fill,
                   ) ,),
                   Container( 
                    
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    height: 130,
                   width: 230,),
                   Positioned(
                    left: 15,
                    top: 10,
                    child: Text(items.itemName,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white)))
                  ],
                ));
  }
}