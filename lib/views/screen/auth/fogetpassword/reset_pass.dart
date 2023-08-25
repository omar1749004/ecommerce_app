import 'package:e_commerce_app/controller/fogetpassword/reset_pass_contrller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../core/class/handle_data.dart';

import '../../../../core/functions/validate_input.dart';
import '../../../widget/auth/costome_text_title.dart';
import '../../../widget/auth/custom_text_body.dart';
import '../../../widget/auth/custome_bottone_auth.dart';
import '../../../widget/auth/custome_textform_auth.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({super.key});
  static final String resetId = "/resetId";
  @override
  Widget build(BuildContext context) {
  Get.put(ResetPassControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        title: Text("Reset Password",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color.fromARGB(255, 94, 89, 89)
             ),),
        automaticallyImplyLeading: true,
      ),
      body: 
      GetBuilder<ResetPassControllerImp>(builder: (controller)=>
        HandlingDataReques(statusRequs:controller.statusRequs ,widget:
      Container(
        padding: EdgeInsets.symmetric(vertical: 1,horizontal: 25),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              
             
            CustomeTitleAuth(title: "New Password",),
             SizedBox(height: 10,),
             CustomeTextBodyAuth(body:
              "Please Enter New Passowrd",),
             
              SizedBox(height: 60,),
            
               CustomeTextFormAuth(
                obscureText: true,
                validator: (val)
              {
                return  validInput(val!, 5, 30, "pass");
              },
                myController: controller.password,
               hintText: "Enter Your Password",
              lableText: "Password",
              icone: Icons.lock_outlined,
              ),
              SizedBox(height:20,),
              CustomeTextFormAuth(
                obscureText: true,
                validator: (val)
              {
                return  validInput(val!, 5, 30, "pass");
              },
                myController: controller.repassword,
               hintText: "Re Enter Your Password",
              lableText: "Re Password",
              icone: Icons.lock_outlined,
              ),
              SizedBox(height:20,),
              
             
            CustomBottoneAuth(text: "Save", ontap:() {controller.resetPassword();},),
             
            ],
          ),
        ),
      ),
      ),
    ));
  }
}