
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/data/models/cart_model.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../link_api.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({super.key, required this.cartmodel,required this.add,required this.delete, required this.itemsCount});
   final CartModel cartmodel;
   final void Function()? add;
   final void Function()? delete;
   final int itemsCount ;
  @override
  Widget build(BuildContext context) {
    return Card(
                child: Container(child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      imageUrl: "${linkImageUpload}/${cartmodel.itemImage}",
                    
                     height: 100,
                    fit: BoxFit.fill,
                    )),
                   Expanded(
                    flex: 3,
                    child: ListTile(title: Text(
                      translateDataBase(cartmodel.itemNameAr, cartmodel.itemName)),subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "${cartmodel.itemPrice} \$",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: ColorApp.KPrimaryColor),
                      ),
                    ),)),
                    Expanded(child: Column(children: [
                    Container(
                      height: 30,
                      child: IconButton(onPressed: add, icon: Icon(Icons.add))),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 30,
                      child: Text("${itemsCount}")),
                    Container(
                      height: 30,
                      child: IconButton(onPressed: delete, icon: Icon(Icons.remove))),
                    ],),)
                ],),),
              );
  }
}