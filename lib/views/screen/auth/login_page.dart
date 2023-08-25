import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/functions/alert_exite_app.dart';
import 'package:e_commerce_app/core/functions/validate_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handle_data.dart';
import '../../widget/auth/costome_text_title.dart';
import '../../widget/auth/custom_text_body.dart';
import '../../widget/auth/custome_bottone_auth.dart';
import '../../widget/auth/custome_textform_auth.dart';
import '../../widget/auth/logo.dart';
import '../../widget/auth/text_move.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static final String loginId = "/login";
  @override
  Widget build(BuildContext context) {
   Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        title:const Text("Sign in",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color.fromARGB(255, 94, 89, 89)
             ),),
        automaticallyImplyLeading: true,
      ),
      body: WillPopScope(
        onWillPop: alertExiteApp,
        child: 
        GetBuilder<LoginControllerImp>(builder: (controller)=>
        HandlingDataReques(statusRequs:controller.statusRequs ,widget:
        Container(
        padding: EdgeInsets.symmetric(vertical: 1,horizontal: 25),
        child: Form(
          key: controller.formKey,
          child: ListView(
           
            children: [
               SizedBox(height: 5,),
              LogoAuth(),
            CustomeTitleAuth(title: "Welcome Back",),
             SizedBox(height: 10,),
             CustomeTextBodyAuth(body: "Sign In whith Your email And Password \n Or Continue whith Sochial Media",),
             
              SizedBox(height: 60,),
             CustomeTextFormAuth(
              validator: (val)
              {
                 return  validInput(val!, 5, 100, "email");
              },
               hintText: "Enter Your Email",
              lableText: "Email",
              icone: Icons.email_outlined,
              myController: controller.email,
              ),
              SizedBox(height:20,),
               CustomeTextFormAuth(
                
                ontap:() {controller.showPassword();},
                obscureText: controller.isHidepass,
                validator: (val)
              {
               return  validInput(val!, 5, 30, "pass");
              },
               hintText: "Enter Your Password",
              lableText: "Password",
              icone: controller.changeIcone(),
              myController: controller.password,
              ),
              SizedBox(height: 20,),
             InkWell(
              onTap: (){
                controller.gotocheckEmail();
              },
               child: Text("forget passwoed",
               textAlign: TextAlign.end,style: TextStyle(color: ColorApp.KPrimaryColor)),
             ),
             SizedBox(height: 10,),
             CustomBottoneAuth(text: "Sing in", ontap: (){controller.login();},),
             SizedBox(height: 10,),
             TextMove(text2: "don't have an account ?",
             text:"Sign Up", ontap:() {controller.gotosignup();})
            ],
          ),
        ),
      ),)
        )));
  }
}
//"Sign Up"
//"don't have an account ?"