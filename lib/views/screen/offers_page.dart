import 'package:e_commerce_app/controller/favorit_controller.dart';
import 'package:e_commerce_app/controller/offer_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';
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
      appBar: AppBar(title: Text("Offers")),
      body: GetBuilder<OffersController>(
        builder: (controller) => HandlingDataView(
          statusRequs: controller.statusRequs,
          widget: ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, index) {

            controllFav.isFavorite[controller.items[index].itemId] = controller.items[index].favorite;
              return  CustomLitItem(itemModel: controller.items[index]);
            }
          ),
        ),
      ),
    );
  }
}
