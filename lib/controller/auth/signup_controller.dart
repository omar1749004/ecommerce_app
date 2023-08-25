
import 'package:e_commerce_app/data/service/remote/auth/sign_up.dart';
import 'package:e_commerce_app/views/screen/auth/login_page.dart';
import 'package:e_commerce_app/views/screen/auth/vrefycode_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/checkinternet.dart';

abstract class SignUpController extends GetxController
{
  signUp();
  gotologin();
  gotoVeryfyCodeSignUp();
}
class SignUpControllerImp extends SignUpController
{
  late TextEditingController username;
  late TextEditingController phone;
 late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
   
  
  List data = [];

  StatusRequst statusRequs =StatusRequst.non;
  @override
  gotologin() {
    Get.offNamed(LoginPage.loginId);
  }
  
  @override
  signUp() async {
    if(formKey.currentState!.validate())
    {
      
      statusRequs = StatusRequst.loading;
      update();
      await Future.delayed( Duration(seconds:1));//###########
  if(await checkinternet() )
  {   
    
     var res = await SignupData().postData(
      name: username.text,
      email: email.text,
      phone: phone.text,
      password: password.text
     );
     
     if(res["status"] =="fail")
     {
      
      statusRequs = StatusRequst.failure;
      Get.defaultDialog(
    title :"Waring",
    middleText: "Email Or phone already Exists",actions: [
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("Ok"))
    ]
       );
     }else{
      
      statusRequs =StatusRequst.sucsess;
      
    // data.addAll();
      Get.offNamed(VeryfyCodeSignUp.veryfyCodeSignUpId,arguments: {
        "email" :email.text
      });
     }
     
  }
  else {
    statusRequs =StatusRequst.offlineFailure;
  }
 
    }

   update();
  }

  
  @override
  void onInit() {
    email =TextEditingController();
    password =TextEditingController();
    username =TextEditingController();
    phone =TextEditingController();

    super.onInit();
  }
  
  @override
  gotoVeryfyCodeSignUp() {
   Get.offNamed(VeryfyCodeSignUp.veryfyCodeSignUpId);
  }
}