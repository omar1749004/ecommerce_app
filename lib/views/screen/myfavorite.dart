import 'package:e_commerce_app/controller/myfavorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/class/handle_data.dart';
import '../widget/custome_appbar.dart';
import '../widget/myfavorite/custome_favorite_item.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});
 static const String myFavoriteId = "/myFavoriteId";
  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoritControllerImp());
    return Scaffold(
      body:  Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: GetBuilder<MyFavoritControllerImp>(builder:(controller) => ListView(
          children: [
            //  CustomAppBar(titlAppbar: "Find Product", onPressedIconenotifi: (){
            //    Get.toNamed(NotificationPage.notificationId);
            // },
            // onPressedSearch:(){controller.onsearchItem();} ,
            // searchController: controller.search!,
            // onChanged: (val)=> controller.checkSearch(val),
            // ),
            SizedBox(height: 20,),
             HandlingDataView(
        statusRequs: controller.statusRequs, widget:
           GridView.builder(
            
            shrinkWrap: true,
            physics:  NeverScrollableScrollPhysics(),
            itemCount: controller.items.length,
            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
               childAspectRatio: 0.66,
              crossAxisCount: 2),
            itemBuilder:(context, index) =>
            
            CustomFavoriteGridView(
              myFavoriteModel: controller.items[index],)),
           
           
             )
            
          ],
        ),),
      ),
    );
  }
}