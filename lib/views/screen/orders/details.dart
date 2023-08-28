import 'package:e_commerce_app/controller/orders/detail_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});
 static const orderDetailsid = "/orderDetailsid";
  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[50],
        title:Text("Orders Details",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25, fontWeight: FontWeight.w700),),),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:10),
        child: ListView(children: [
        Table(
          
          children: [
            TableRow(children: [
              Text("Item",textAlign: TextAlign.center, style: TextStyle(
                color: ColorApp.KPrimaryColor,
                fontWeight: FontWeight.bold
                ),),
              Text("QTY",textAlign: TextAlign.center,style: TextStyle(
                color: ColorApp.KPrimaryColor,
                fontWeight: FontWeight.bold
                ),),
              Text("Price",textAlign: TextAlign.center,style: TextStyle(
                color: ColorApp.KPrimaryColor,
                fontWeight: FontWeight.bold
                ),),
            ]),
            TableRow(children: [
              Text("Macbook",textAlign: TextAlign.center,style: TextStyle(height: 2),),
              Text("2",textAlign: TextAlign.center,style: TextStyle(height: 2)),
              Text("900",textAlign: TextAlign.center,style: TextStyle(height: 2)),
            ]),
            TableRow(children: [
              Text("Iphone",textAlign: TextAlign.center,),
              Text("5",textAlign: TextAlign.center),
              Text("3444",textAlign: TextAlign.center),
            ]),
          
          ],
        ),
         SizedBox(height: 10,),
         Text("Total Price : 2400\$" ,textAlign: TextAlign.center,style: TextStyle(
                color: ColorApp.KPrimaryColor,
                fontWeight: FontWeight.bold
                ),),
                Card(child: (Container(child: ListTile(
                title:  Text("Home"),
                subtitle:  Text("jsf glkjghjg fknmf"),

                ),)),)
      ],)),
     
    );
  }
}