
import 'package:e_commerce_app/core/class/handle_data.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:e_commerce_app/views/screen/cart_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product_details_contrroler.dart';
import '../widget/product_details/backgound_product.dart';
import '../widget/product_details/price_andanount.dart';
import '../widget/product_details/supitem_list.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  static String productDetailsId = "/productDetailsId";
  @override
  Widget build(BuildContext context) {
   
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        height: 45,
        margin: EdgeInsets.all(10),
        child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: ColorApp.KPrimaryColor,
            child: Text(
              "Go to Card",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
     
              Get.toNamed(Cart.cartId);
               
            }),
      ),
      body: Container(
        child: ListView(
          children: [
            BackGrondProductDetails(),
            SizedBox(
              height: 100,
            ),
            GetBuilder<ProductDetailsControllerImp>(builder: (controller) => HandlingDataView(
        statusRequs: controller.statusRequs   ,
       widget:
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translateDataBase(controller.itemsModel.itemNameAr,
                        controller.itemsModel.itemName),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PriceAndAmount(
                    add: () {
                     
                      controller.add();
                    },
                    remove: () {
                    
                     controller.delete();
                    },
                    price: controller.itemsModel.itemPriceDiscound.toString(),
                    count: "${controller.countItems}",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    translateDataBase(controller.itemsModel.itemDescAr,
                            controller.itemsModel.itemDesc) +
                        controller.itemsModel.itemDesc,
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   "Color",
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // CustomSupItem(),
                ],
              ),
            ),
        ))],
        ),
      ),);
  
  }
}
