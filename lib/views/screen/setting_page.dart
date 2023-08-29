import 'package:e_commerce_app/controller/settings_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/views/address/view.dart';
import 'package:e_commerce_app/views/screen/orders/archive.dart';
import 'package:e_commerce_app/views/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return  Container(
      child: ListView(
        children:[ Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
          Container(height: Get.width / 3,color: ColorApp.KPrimaryColor,),
          Positioned(top: Get.width /5, child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 225, 225, 225),
            radius: 50,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(ImageAsset.logo,))
          
          ),),
          Card(child: Column(children: [
            
          ]),)
        ]),
        SizedBox(height: 70,),
         Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
           child: Card(child: Column(children: [
            ListTile(title: Text("Disable Notifycation"),
            onTap: (){},
              trailing: Switch(onChanged:(value){},value: false,  )
              ),
            Divider(),
             ListTile(title: Text("Orders"),
             onTap: (){
              Get.toNamed(OrdersPending.ordersPendingid);
             },
              trailing: Icon(Icons.card_travel_outlined)),
              Divider(),
             ListTile(title: Text("Archive"),
             onTap: (){
              Get.toNamed(OrdersArchive.ordersArchiveid);
             },
              trailing: Icon(Icons.card_travel_outlined)),
            Divider(),
             ListTile(title: Text("Adress"),
             onTap: (){
              Get.toNamed(AddressView.addressViewid);
             },
              trailing: Icon(Icons.location_on_outlined)),
            Divider(),
            ListTile(title: Text("About us"),
            onTap: (){},
              trailing: Icon(Icons.help_outline_outlined)
            ),
            Divider(),
             ListTile(title: Text("Contact us"),
             onTap: (){},
              trailing: Icon(Icons.phone_callback_outlined)
             ),
             Divider(),
              ListTile(
                 title: Text("Logout"),
                onTap: (){
                  controller.logout();
                },
              trailing: Icon(Icons.exit_to_app)
              ,)
                 ]
                 )
                 ,),
         )
      ]),
    );
  }
}