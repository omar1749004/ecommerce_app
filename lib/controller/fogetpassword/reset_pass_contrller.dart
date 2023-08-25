import 'package:e_commerce_app/data/service/remote/fogetpassword/resete_pass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/class/statuscode.dart';
import '../../core/functions/checkinternet.dart';
import '../../views/screen/auth/fogetpassword/sucsess_reset.dart';

abstract class ResetPassController extends GetxController
{
  resetPassword();
  
}
class ResetPassControllerImp extends ResetPassController
{

 late TextEditingController password;
 late TextEditingController repassword;
StatusRequst statusRequs =StatusRequst.non;
 GlobalKey<FormState> formKey =GlobalKey<FormState>();
  String? email ;
  @override
  
  
  @override
  resetPassword() async{
    if(formKey.currentState!.validate())
    {
      if(password.text!=repassword.text)
      {
       Get.defaultDialog(
       title :"Waring",
        middleText: "Password Not Match",actions: [
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("Ok")) ]
       );
      }else{

      statusRequs = StatusRequst.loading;
      update();
      await Future.delayed( Duration(seconds:1));//###########
  if(await checkinternet() )
  {   
    print(password.text);
     var res = await ResetPasswordData().postData(
      
      password: password.text,
      email: email!,
      
     );
     
     if(res["status"] =="fail")
     {
      statusRequs = StatusRequst.failure;
       Get.defaultDialog(
       title :"Waring",
        middleText: "Please Try Agine",actions: [
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("Ok")) ]
       );
     }else{
      
      statusRequs =StatusRequst.sucsess;
      Get.offNamed(SuccessResetPass.successResetId);
     }
  }
  else {
    statusRequs =StatusRequst.offlineFailure;
  }
    }}
    update();
  }

  
  @override
  void onInit() {
    password =TextEditingController();
    repassword =TextEditingController();
     email = Get.arguments["email"];
    super.onInit();
  }
}