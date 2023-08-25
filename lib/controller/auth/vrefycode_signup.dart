import 'package:e_commerce_app/views/screen/auth/succes_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/checkinternet.dart';
import '../../data/service/remote/auth/verfycode .dart';



abstract class VeryfyCodeSignUoCotoller extends GetxController
{
  checkcode();
  gotoSuccessSignUp();
}
class VeryfyCodeSignUoCotollerImp extends VeryfyCodeSignUoCotoller
{
 String? email ;
 late String vrifiCode;
 StatusRequst statusRequs =StatusRequst.non;
 
  @override
  checkcode() {
   
  }
  
  @override
  gotoSuccessSignUp() async {
  
      
      statusRequs = StatusRequst.loading;
      update();
      await Future.delayed( Duration(seconds: 1)); //#############
  if(await checkinternet() )
  {   
    
     var res = await VerfyCodeData().postData(
      email: email!,
      verfycode: vrifiCode
     );
     
     if(res["status"] =="fail")
     {
      
      statusRequs = StatusRequst.failure;
      Get.defaultDialog(
    title :"Waring",
    middleText: "Verfy Code Not Correct",actions: [
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("Ok"))
    ]
       );
     }else{
      
      statusRequs =StatusRequst.sucsess;
      
    // data.addAll();
      Get.offNamed(SuccessSignUp.successSignUpId);
     }  
    }
   update(); 
  }
  
  
  @override
  void onInit() {
    
    email = Get.arguments["email"];
    super.onInit();
  }
  
  resend(){
    VerfyCodeData().resendData(
      email: email! );
  }
}