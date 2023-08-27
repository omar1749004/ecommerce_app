import 'package:e_commerce_app/controller/orders/pending_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';
import 'package:e_commerce_app/views/widget/order/order_card.dart';

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




}