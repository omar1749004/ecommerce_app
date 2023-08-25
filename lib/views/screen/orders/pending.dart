import 'package:e_commerce_app/controller/orders/pending_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/data/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});
  static const ordersPendingid ="/ordersPending" ;
  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersControllerImp());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title:Text("Orders",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25, fontWeight: FontWeight.w700),),

        backgroundColor: Colors.grey[50],

      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: 
         GetBuilder<PendingOrdersControllerImp>(builder: (controller)=>
         HandlingDataView(
          statusRequs: controller.statusRequs, widget: 
          ListView.builder(
            itemCount: controller.data.length,
          itemBuilder: (context, index) => 
          CardOrders(ordersModels: controller.data[index],)
          )),
      ),),
    );
  }




}class CardOrders extends GetView<PendingOrdersControllerImp> {
  const CardOrders({super.key, required this.ordersModels});
  final OrdersModels ordersModels;
  @override
  Widget build(BuildContext context) {
    return  Card(child: Container(
        padding: EdgeInsets.all(10),
        
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("Order Number : #${ordersModels.ordersId}", style:const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold),),
         const Divider(color: Colors.black,),
          Text("Order Type : ${controller.printOrderType(ordersModels.ordersType)}"),
          Text("Order Price : ${ordersModels.ordersPrice} \$",style: TextStyle(height: 2),),
          Text("Delivery Price : ${ordersModels.ordersPricedelivery} \$",style: TextStyle(height: 2)),
          Text("Payment Methode : ${controller.printOrderPaymentMethod(ordersModels.ordersPaymentmethod)}",
          style: TextStyle(height: 2)),
          Text("Order Status : ${controller.printOrderStatuse(ordersModels.ordersStatuse)} ",style: TextStyle(height: 2)),
        const Divider(color: Colors.black,),
          Row(
            children: [
              Text("Total Price : ${ordersModels.ordersTotalprice} \$" ,style:const TextStyle(
              color: ColorApp.KPrimaryColor, fontWeight: FontWeight.bold),),
             const Spacer(),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                onPressed: (){}, 
                color: const Color.fromARGB(255, 195, 159, 250),
               child:const Text("Details",style: TextStyle(color: ColorApp.secondColor),),
               
              )
            ],
          )
       ]),),);
  }
}