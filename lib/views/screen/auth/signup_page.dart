import 'package:e_commerce_app/controller/auth/signup_controller.dart';

import 'package:e_commerce_app/core/functions/validate_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handle_data.dart';
import '../../../core/functions/alert_exite_app.dart';
import '../../widget/auth/costome_text_title.dart';
import '../../widget/auth/custom_text_body.dart';
import '../../widget/auth/custome_bottone_auth.dart';
import '../../widget/auth/custome_textform_auth.dart';

import '../../widget/auth/text_move.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static final String signUpId = "/signUp";
  @override
  Widget build(BuildContext context) {
Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        title: Text("Sign Up",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color.fromARGB(255, 94, 89, 89)
             ),),
        automaticallyImplyLeading: true,
      ),
      body: WillPopScope(
        onWillPop: alertExiteApp,
        child: GetBuilder<SignUpControllerImp>(builder: (controller)=>
        HandlingDataReques(statusRequs:controller.statusRequs ,widget:
        Container(
        padding: EdgeInsets.symmetric(vertical: 1,horizontal: 25),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              
             
            CustomeTitleAuth(title: "Welcome Back",),
             SizedBox(height: 10,),
             CustomeTextBodyAuth(body: "Sign Up whith Your email And Password \n Or Continue whith Sochial Media",),
             
              SizedBox(height: 60,),
             CustomeTextFormAuth(
              validator: (val)
              {
                return validInput(val!, 5, 40, "username");
              },
              myController: controller.username,
               hintText: "Enter Your Username",
              lableText: "Username",
              icone: Icons.person_outline,
              ),
              SizedBox(height:20,),
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
              CustomeTextFormAuth(
                isPhoneNumber: true,
                validator: (val)
              {
                return validInput(val!, 11, 20, "phone");
              },
                myController: controller.phone,
               hintText: "Enter Your Phone",
              lableText: "Phone",
              icone: Icons.phone_android,
              ),
              SizedBox(height:20,),
              CustomeTextFormAuth(
                obscureText: true,
                validator: (val)
              {
                return validInput(val!, 5, 40, "pass");
              },
                myController: controller.password,
               hintText: "Enter Your Password",
              lableText: "Password",
              icone: Icons.lock_outlined,
              ),
              SizedBox(height: 20,),
             
             SizedBox(height: 10,),
             CustomBottoneAuth(text: "Sing Up", ontap:() {controller.signUp();},),
             SizedBox(height: 10,),
             TextMove(text2: " have an account ?",
             text:"Sign In", ontap:() {
              controller.gotologin();
             })
            ],
          ),
        ),
      ),),
      )
    ));
  }
}
