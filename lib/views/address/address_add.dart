import 'package:e_commerce_app/controller/adress/adress_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key});
  static const String addressAddid = "/addressAddid";
  @override
  Widget build(BuildContext context) {
    Get.put(AdressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Address"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: GetBuilder<AdressControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequs: controller.statusRequst,
              widget: Column(
                children: [
                  Expanded(
                      child: OpenStreetMapSearchAndPick(
                          center: controller.latLong,
                          buttonColor: Colors.red,
                          locationPinIconColor: Colors.red,
                          locationPinTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                          onGetCurrentLocationPressed: () =>
                              controller.getCurrentLocation(),
                          buttonText: 'Complete Details Location',
                          onPicked: (pickedData) {
                            controller.savelocation(pickedData);
                          })),
                ],
              ),),
        ),
      ),
    );
  }
}
