import 'package:e_commerce_app/controller/adress/address_add_details_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/functions/validate_input.dart';
import 'package:e_commerce_app/core/shared/custom_bottom.dart';
import 'package:e_commerce_app/views/widget/auth/custome_textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdressAddDetails extends StatelessWidget {
  const AdressAddDetails({Key? key});
  static const String adressAddDetailsid = "/addressAddPrt2id";
  @override
  Widget build(BuildContext context) {
    Get.put(AdressAddDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Details Address"),
        backgroundColor: ColorApp.KPrimaryColor
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        
        child: GetBuilder<AdressAddDetailsControllerImp>(
          builder:(controller) => HandlingDataView(
            statusRequs: controller.statusRequs, widget:  Form(
          key: controller.formKey,
          child: ListView(
          children: [
             SizedBox(height: 10,),
            CustomeTextFormAuth(
              hintText: "city",
               lableText: "city",
                icone: Icons.location_city,
                 myController: controller.city,
                  validator: (val){
                      return validInput(val!, 2, 20, "city");
                  }),
                  SizedBox(height: 20,),
                  CustomeTextFormAuth(
              hintText: "street",
               lableText: "street",
                icone: Icons.streetview,
                 myController: controller.street,
                  validator: (val){
                    return validInput(val!, 2, 20, "street");
                  }),
                   SizedBox(height: 20,),
                  CustomeTextFormAuth(
              hintText: "name",
               lableText: "name",
                icone: Icons.near_me,
                 myController: controller.name,
                  validator: (val){
                    return validInput(val!, 4, 20, "name");
                  }),
                   SizedBox(height: 20,),
              CustomBottom(text: "Add",ontap: (){
                controller.adddAdress();
              },)
        ]),
        ),)
      
      ),
      )
      );
    
  }
}
