import 'package:e_commerce_app/controller/favorit_controller.dart';
import 'package:e_commerce_app/controller/offer_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';
import 'package:e_commerce_app/views/screen/myfavorite.dart';
import 'package:e_commerce_app/views/widget/custome_appbar.dart';
import 'package:e_commerce_app/views/widget/list%20_item_search.dart';

import 'package:e_commerce_app/views/widget/offers/custom_list_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});
  static const offersPageid = "/offersPageid";
  @override
  Widget build(BuildContext context) {
   FavoriteControllerImp controllFav = Get.put(FavoriteControllerImp());
    Get.put(OffersController());
    return Scaffold(
      body: Container(
         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        
        child: GetBuilder<OffersController>(
          builder: (controller) => ListView(
            children: [
                CustomAppBar(titlAppbar: "Find Product", onPressedIconeFavorite: (){
                 Get.toNamed(MyFavorite.myFavoriteId);
              },
              
              onPressedSearch:(){controller.onsearchItem();} ,
              searchController: controller.search!,
              onChanged: (val)=> controller.checkSearch(val),
              ),
              SizedBox(height: 20,),
              HandlingDataView(
                statusRequs: controller.statusRequs,
                widget:controller.isSearch ? 
               ListItemsSearch(searchItem: controller.searchItem,)  : 
               ListView.builder(
                  physics:const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
      
                  controllFav.isFavorite[controller.items[index].itemId] = controller.items[index].favorite;
                    return  CustomLitItem(itemModel: controller.items[index]);
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
