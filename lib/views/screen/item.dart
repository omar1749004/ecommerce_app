import 'package:e_commerce_app/controller/Items_controller.dart';
import 'package:e_commerce_app/controller/favorit_controller.dart';
import 'package:e_commerce_app/views/screen/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/class/handle_data.dart';
import '../widget/custome_appbar.dart';
import '../widget/items/custom_grideview.dart';
import '../widget/items/list_categories.dart';
import '../widget/list _item_search.dart';
class Items extends StatelessWidget {
  const Items({super.key});
static final String itemsId = "/itemsId";
  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
     FavoriteControllerImp controllFav = Get.put(FavoriteControllerImp());

    return Scaffold(
      body:
    
         Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ListView(
          children: [
            CustomAppBar(titlAppbar: "Find Product", onPressedIconeFavorite: (){
               Get.toNamed(MyFavorite.myFavoriteId);
            },
            onPressedSearch:(){controller.onsearchItem();} ,
            searchController: controller.search!,
            onChanged: (val)=> controller.checkSearch(val),
            ),
            SizedBox(height: 20,),
          
            ListCategoriesItem(),
            GetBuilder<ItemsControllerImp>(builder: (controller)=>
     HandlingDataView(
        statusRequs: controller.statusRequs, widget:
           controller.isSearch ? 
        ListItemsSearch(searchItem: controller.searchItem,)
          :
             GridView.builder(
        shrinkWrap: true, // مهم
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.66),
        itemBuilder: (BuildContext context, index) {
             
          controllFav.isFavorite[controller.items[index].itemId] = controller.items[index].favorite;


         return  CustomGridView(

          itemModel: controller.items[index],);
        }
             )
        ))],
      ),
    ));
    
   
  }
}
 