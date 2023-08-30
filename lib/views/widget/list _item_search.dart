import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controller/home_controller.dart';
import '../../core/functions/translate_database.dart';
import '../../data/models/item_model.dart';
import '../../link_api.dart';

class ListItemsSearch extends GetView<HomeContrllerImp> {
  const ListItemsSearch({super.key, required this.searchItem,});
  final List<ItemsModel> searchItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: searchItem.length,
      itemBuilder: (context ,index){
      return 
      
       InkWell(
           onTap: (){
              controller.gotoProductDetails(searchItem[index]);
            },
          child:
      Container(
        padding: EdgeInsets.symmetric(vertical:5),
      child:
         Card(child: 
             Container(
              padding: EdgeInsets.all(10),
               child: Row(children: [
                 Expanded(child: CachedNetworkImage(
                  height: 80,
                  imageUrl: "${linkImageUpload}/${searchItem[index].itemImage}")),
                 Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Text(
                      translateDataBase(
                        searchItem[index].itemNameAr, searchItem[index].itemName),),
                        subtitle: Text(searchItem[index].cName!),
                  ))
                       ]),
             ),
          ),
        ),
      );
    });
  }
}