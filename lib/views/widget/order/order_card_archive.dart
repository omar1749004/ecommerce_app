import 'package:e_commerce_app/controller/orders/archive_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/data/models/orders_model.dart';
import 'package:e_commerce_app/views/screen/orders/details.dart';
import 'package:e_commerce_app/views/widget/order/dailog_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jiffy/jiffy.dart';

class CardOrdersArchive extends GetView<ArchiveOrdersControllerImp> {
  const CardOrdersArchive({ super.key, required this.ordersModels,});
  final OrdersModels ordersModels;

  @override
  Widget build(BuildContext context) {
    return  Card(child: Container(
        padding:const EdgeInsets.all(10),
        
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          Row(children: [
             Text("Order Number : #${ordersModels.ordersId}", style:const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold),),
          Spacer(),
         // Text(ordersModels.ordersDate)
         Text(Jiffy.parse(
          ordersModels.ordersDate , pattern: 'yyyy-MM-dd HH:mm:ss').fromNow(),
          style:const TextStyle(color: ColorApp.KPrimaryColor,fontWeight: FontWeight.bold),
         )
          ],),
         const Divider(color: Colors.black,),
          Text("Order Type : ${controller.printOrderType(ordersModels.ordersType)}"),
          Text("Order Price : ${ordersModels.ordersPrice} \$",style: TextStyle(height: 2),),
          Text("Delivery Price : ${ordersModels.ordersPricedelivery} \$",style: TextStyle(height: 2)),
          Text("Payment Methode : ${controller.printOrderPaymentMethod(ordersModels.ordersPaymentmethod)}",
          style:const TextStyle(height: 2)),
          Text("Order Status : ${controller.printOrderStatuse(ordersModels.ordersStatuse)} ",style: TextStyle(height: 2)),
        const Divider(color: Colors.black,),
          Row(
            children: [
              Text("Total Price : ${ordersModels.ordersTotalprice} \$" ,style:const TextStyle(
              color: ColorApp.KPrimaryColor, fontWeight: FontWeight.bold),),
             const Spacer(),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                onPressed: (){
                  Get.toNamed(OrderDetails.orderDetailsid, arguments: {
                    "ordersModel" :ordersModels
                  });
                }, 
                color: const Color.fromARGB(255, 195, 159, 250),
               child:const Text("Details",style: TextStyle(color: ColorApp.secondColor),),
               
              ),
              const SizedBox(width: 10,),
              if(ordersModels.rating == 0)
              
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                onPressed: (){
                  showDialogRating(context ,ordersModels.ordersId.toString());
                }, 
                color: const Color.fromARGB(255, 195, 159, 250),
               child:const Text("Rating",style: TextStyle(color: ColorApp.secondColor),),
               
              ),
              
               
              
            ],
          )
       ]),),);
  }
}