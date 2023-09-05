import 'package:e_commerce_app/controller/adress/view_address.controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';
import 'package:e_commerce_app/data/models/addres_model.dart';
import 'package:e_commerce_app/views/address/address_add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});
  static const String addressViewid = "/addressViewid";
  @override
  Widget build(BuildContext context) {
    Get.put(AdressViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("My adress"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AddressAdd.addressAddid);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<AdressViewControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequs: controller.statusRequs,
            widget: Container(
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => CardAddress(
                          addresModels: controller.data[index],
                          onDelete: () {
                            Get.defaultDialog(
                                title: "Woring",
                                middleText:
                                    "Are You Sure Delete ${controller.data[index].name} Category",
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("cancel")),
                                  ElevatedButton(
                                      onPressed: () {
                                       controller.deleteAddress(
                                controller.data[index].addressid);
                                        Get.back();
                                      },
                                      child: const Text("Yes")),
                                ]);
                            
                          },
                        )))),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  const CardAddress(
      {super.key, required this.addresModels, required this.onDelete});
  final AddresModels addresModels;
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Text("${addresModels.name}"),
            subtitle: Text(
              "city: ${addresModels.city} \nstreet: ${addresModels.street}",
              style: TextStyle(height: 1.5),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete_outline),
              onPressed: onDelete,
            ),
          )),
    );
  }
}
