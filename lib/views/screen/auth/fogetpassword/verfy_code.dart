import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';


import '../../../../controller/fogetpassword/vrifiy_code_controller.dart';
import '../../../../core/class/handle_data.dart';

import '../../../widget/auth/costome_text_title.dart';
import '../../../widget/auth/custom_text_body.dart';


class Verfycode extends StatelessWidget {
  const Verfycode({super.key});
  static final String verfyid = "/verfyid";
  @override
  Widget build(BuildContext context) {
      Get.put(VeryfyCodeCotollerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        title: Text("Verification code ",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color.fromARGB(255, 94, 89, 89)
             ),),
        automaticallyImplyLeading: true,
      ),
      body: 
      GetBuilder<VeryfyCodeCotollerImp>(builder: (controller)=>
        HandlingDataReques(statusRequs:controller.statusRequs ,widget:
      Container(
        padding: EdgeInsets.symmetric(vertical: 1,horizontal: 25),
        child: ListView(
          children: [
            
           
          CustomeTitleAuth(title: "Check code",),
           SizedBox(height: 10,),
           CustomeTextBodyAuth(
            body: 
            "Please Enter The Digit Code Sent to \n omar@gmail.com",),
           
            SizedBox(height: 60,),
          
            OtpTextField(
              fieldWidth: 50,
             numberOfFields: 5,
            borderColor: Color(0xFF512DA8),
             
               showFieldAsBox: true, 
                   //runs when a code is typed in
              onCodeChanged: (String code) {
            //handle validation or checks here           
               },
               //runs when every textfield is filled
               
                 onSubmit: (String verfycode){
                  controller.vrifiCode =verfycode;
                  
                 controller.gotoResetPass();
                 }
    ),
            SizedBox(height:20,),
            
           
           
           
          ],
        ),
      ),
      ),
    ));
  }
}