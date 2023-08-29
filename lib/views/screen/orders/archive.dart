import 'package:e_commerce_app/controller/orders/archive_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';

import 'package:e_commerce_app/views/widget/order/order_card_archive.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});
  static const ordersArchiveid = "/ordersArchiveid";
  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersControllerImp());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Orders",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.grey[50],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<ArchiveOrdersControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequs: controller.statusRequs,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => CardOrdersArchive(
                ordersModels: controller.data[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
