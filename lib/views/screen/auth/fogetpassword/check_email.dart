import 'package:e_commerce_app/controller/fogetpassword/check_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../core/class/handle_data.dart';

import '../../../../core/functions/validate_input.dart';
import '../../../widget/auth/costome_text_title.dart';
import '../../../widget/auth/custom_text_body.dart';
import '../../../widget/auth/custome_bottone_auth.dart';
import '../../../widget/auth/custome_textform_auth.dart';



class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});
  static final String checkEmailId = "/checkEmailId";
  @override
  Widget build(BuildContext context) {
    Get.put(CheckEmailControllerImp());
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        title: Text("Foget Password",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color.fromARGB(255, 94, 89, 89)
             ),),
        automaticallyImplyLeading: true,
      ),
      body: 
       GetBuilder<CheckEmailControllerImp>(builder: (controller)=>
        HandlingDataReques(statusRequs:controller.statusRequs ,widget:
      Container(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: 25),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              
             
            CustomeTitleAuth(title: "Check Email",),
             SizedBox(height: 10,),
             CustomeTextBodyAuth(
              body: 
              "Please Enter your Email Address To \n Resive A Verification Vode",),
             
              SizedBox(height: 30,),
            
              CustomeTextFormAuth(
                validator: (val)
              {
                return validInput(val!, 5, 100, "email");
              },
                myController: controller.email,
               hintText: "Enter Your Email",
              lableText: "Email",
              icone: Icons.email_outlined,
              ),
              SizedBox(height:20,),
              
             
             CustomBottoneAuth(text: "Check", ontap: (){
              controller.checkemail();
             },),
             
            ],
          ),
        ),
      ),
       ),
    ));
  }
}
