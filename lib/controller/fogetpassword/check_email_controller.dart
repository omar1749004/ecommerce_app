import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/data/service/remote/fogetpassword/check_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/functions/checkinternet.dart';
import '../../views/screen/auth/fogetpassword/verfy_code.dart';

abstract class CheckEmailController extends GetxController
{
  checkemail();

}
class CheckEmailControllerImp extends CheckEmailController
{

 late TextEditingController email;
GlobalKey<FormState> formKey =GlobalKey<FormState>();
   
  StatusRequst statusRequs =StatusRequst.non;
  @override
  
  
  @override
  checkemail() async{
    if(formKey.currentState!.validate())
    {
         statusRequs = StatusRequst.loading;
         
      update();
      await Future.delayed( Duration(seconds:1));//###########
  if(await checkinternet() )
  {   
    
     var res = await CheckEmail().postData(
      email: email.text,
     );
     
     if(res["status"] =="fail")
     {
      
      statusRequs = StatusRequst.failure;
       Get.defaultDialog(
       title :"Waring",
        middleText: "Email Not Found",actions: [
      ElevatedButton(onPressed: (){
        print("object");
        Get.back();
      }, child: Text("Ok")) ]
       );
     }else{
      
      statusRequs =StatusRequst.sucsess;
     Get.offNamed(Verfycode.verfyid,arguments: {
      "email" : email.text
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
    

    super.onInit();
  }
}