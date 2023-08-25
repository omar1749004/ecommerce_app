import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/views/screen/auth/fogetpassword/check_email.dart';

import 'package:e_commerce_app/views/screen/auth/signup_page.dart';
import 'package:e_commerce_app/views/screen/home.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/checkinternet.dart';
import '../../data/service/remote/auth/login.dart';

 import 'package:firebase_messaging/firebase_messaging.dart';



import '../../views/screen/auth/vrefycode_signup.dart';

abstract class LoginController extends GetxController
{
  login();
  gotosignup();
  gotocheckEmail();
  showPassword();
  changeIcone();
  
}
class LoginControllerImp extends LoginController
{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 late TextEditingController email;
  late TextEditingController password;
  bool isHidepass = true ;
  IconData icone =CupertinoIcons.eye_slash;
   StatusRequst statusRequs =StatusRequst.non;
   MyServices services = Get.find();
  @override
  login()async {
    if(formKey.currentState!.validate())
    {
      
      statusRequs = StatusRequst.loading;
      update();
      await Future.delayed( Duration(seconds:1));//###########
  if(await checkinternet() )
  {   
    
     var res = await LoginData().postData(
      email: email.text,
      password: password.text
     );
     
     if(res["status"] =="failure")
     {
      statusRequs = StatusRequst.failure;
       Get.defaultDialog(
       title :"Waring",
        middleText: "Email Or Passowrd Not Correct",actions: [
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("Ok")) ]
       );
     }else if(res["status"] =="success"){
      
      Map data=  res["data"];
      if(data["users_approve"] == 1)
      {
        
        services.sharedPreferences.setString("id",data["users_id"].toString() );
        
      services.sharedPreferences.setString("username",data["users_name"] );
      services.sharedPreferences.setString("email",data["users_email"]);
      services.sharedPreferences.setString("phone",data["users_phone"] );
      services.sharedPreferences.setString("step" ,"2");

      FirebaseMessaging.instance.subscribeToTopic("users");
      FirebaseMessaging.instance.subscribeToTopic("users${services.sharedPreferences.getString("id")}");
      
      statusRequs =StatusRequst.sucsess;
      Get.offNamed(HomePage.homepageId);
      }else{
       Get.offNamed(VeryfyCodeSignUp.veryfyCodeSignUpId,arguments: {
        "email" :email.text
      });
      }
      
     }
  }
  else {
    statusRequs =StatusRequst.offlineFailure;
  }
    }
     update();
  }
  
  @override
  gotosignup() {
   Get.offNamed(SignUp.signUpId);
   Get.delete<LoginControllerImp>();
  }
  @override
  void onInit() async{
    
    email =TextEditingController();
    password =TextEditingController();
     
     
    
    super.onInit();
  }
  
  @override
  gotocheckEmail() {
   Get.toNamed(CheckEmail.checkEmailId);
   Get.delete<LoginControllerImp>();
  }
  
  @override
  showPassword() {
    isHidepass =!isHidepass;
    update();
  }
  
  @override
  changeIcone() {
    update();
    return icone = isHidepass ?CupertinoIcons.eye_slash:CupertinoIcons.eye;
    
  }
}