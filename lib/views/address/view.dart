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
        child: Icon(Icons.add),
      ),
      body: GetBuilder<AdressViewControllerImp>(builder: (controller) => HandlingDataView(
        statusRequs: controller.statusRequs, widget: Container(
        child: ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: (context,index)=> 
          CardAddress(addresModels: controller.data[index],onDelete: (){
            
            controller.deleteAddress(controller.data[index].addressid);
          },)
          ))
      ),),);
    
  }
}
class CardAddress extends StatelessWidget {
  const CardAddress({super.key, required this.addresModels,required this.onDelete});
final AddresModels addresModels;
final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text("${addresModels.name}"),
          subtitle: Text("city: ${addresModels.city} \nstreet: ${addresModels.street}",
          style: TextStyle(height: 1.5),),
          trailing: IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: onDelete,)
          ,)
      )
    ,);
  }
}