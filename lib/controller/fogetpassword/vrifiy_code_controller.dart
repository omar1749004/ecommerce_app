import 'package:e_commerce_app/data/service/remote/fogetpassword/verfycode_foget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/checkinternet.dart';
import '../../views/screen/auth/fogetpassword/reset_pass.dart';


abstract class VeryfyCodeCotoller extends GetxController
{
  
  gotoResetPass();
}
class VeryfyCodeCotollerImp extends VeryfyCodeCotoller
{

 late String vrifiCode;
  StatusRequst statusRequs =StatusRequst.non;
  String? email;

 
  @override
  gotoResetPass()async {
   statusRequs = StatusRequst.loading;
      update();
      await Future.delayed( Duration(seconds: 1)); //#############
  if(await checkinternet() )
  {   
    
     var res = await VerfyCodeForgetData().postData(
      email: email!,
      verfycode: vrifiCode
     );
     print(vrifiCode);
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
      Get.offNamed(ResetPass.resetId,arguments: {
        "email" :email
      });
     }  
      }
   update(); 
  }
  
 
  
  
  @override
  void onInit() {
    email =Get.arguments["email"];
    
    super.onInit();
  }
  
  
}