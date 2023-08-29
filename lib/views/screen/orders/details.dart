import 'package:e_commerce_app/controller/orders/detail_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';
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
        title: Text(
          "Orders Details",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrderDetailsController>(builder: (controller)=> 
        HandlingDataView(statusRequs: controller.statusRequs, widget: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Table(
                      children: [
                        TableRow(children: [
                          Text(
                            "Item",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorApp.KPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "QTY",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorApp.KPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Price",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorApp.KPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                        ...List.generate(controller.data.length, (index) =>
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${controller.data[index].itemName}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${controller.data[index].itemsCount}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${controller.data[index].itemPrice}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]), )
                        
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Total Price : ${controller.ordersModels.ordersTotalprice}\$",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorApp.KPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (controller.ordersModels.addressid != null)
              Card(
                child: (Container(
                  child: ListTile(
                    title: Text("Shipping Address",
                        style: TextStyle(
                            color: ColorApp.KPrimaryColor,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        "${controller.ordersModels.city}  ${controller.ordersModels.street} "),
                  ),
                )),
              ),
          ],
        ),))
      ),
    );
  }
}
