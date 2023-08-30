import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';

import 'package:e_commerce_app/views/widget/home/custom_card_home.dart';
import 'package:e_commerce_app/views/widget/home/custom_title_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../widget/custome_appbar.dart';
import '../widget/home/list_categories_home.dart';
import '../widget/home/list_item_home.dart';
import '../widget/list _item_search.dart';
import 'myfavorite.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static final String homepageId = "/homepageId";
  @override
  Widget build(BuildContext context) {
  HomeContrllerImp controller=  Get.put(HomeContrllerImp());

    return 
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
              GetBuilder<HomeContrllerImp>(builder:(controller) => HandlingDataView(
        statusRequs: controller.statusRequs, widget:
          controller.isSearch ? 
        ListItemsSearch(searchItem: controller.searchItem,)
          : const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
               CustomCardHome(title: "A Summer Surprice", body: "Cashback 20%"),
            CustomeTitleHome(title: "Categories",),
             SizedBox(height: 20,),
            ListCategories(),
            CustomeTitleHome(title: "Top Selling",),
             SizedBox(height: 10,),
            ListItemHome() ,
            CustomeTitleHome(title: "Offers",),
             SizedBox(height: 10,),
            ListItemHome() ,
            ],
           )
         ) )],
        ),
      );
    
  }
}
