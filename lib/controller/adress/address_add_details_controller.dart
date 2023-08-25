import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/core/functions/checkinternet.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/service/remote/address_data.dart';
import 'package:e_commerce_app/views/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class AdressAddDetailsController extends GetxController
{
  intialData();
}
class AdressAddDetailsControllerImp extends AdressAddDetailsController
{
  TextEditingController? name ;
  TextEditingController? city;
  TextEditingController? street; 
   StatusRequst statusRequs =StatusRequst.non ;
    List data =[];
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
 
   MyServices myServices  =Get.find();
  String? lat;
  String? long;
  @override
  intialData(){
  lat =Get.arguments["lat"];
  long=Get.arguments["long"];
  name = TextEditingController();
  city = TextEditingController();
  street = TextEditingController();
  }
  adddAdress() async {
    if(formKey.currentState!.validate())
    {
      
      statusRequs = StatusRequst.loading;
      update();
      await Future.delayed( Duration(seconds:1));//###########
  if(await checkinternet() )
  {   
    
     var res = await AddressData().addadress(
     myServices.sharedPreferences.getString("id")!,
     name!.text,
     city!.text,
     street!.text,
     lat!,
     long!
     );
     
     if(res["status"] =="failure")
     {
      statusRequs = StatusRequst.failure;
     }else{
      
      statusRequs =StatusRequst.sucsess;
       Get.offAllNamed(HomePage.homepageId);
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
    intialData();
     super.onInit();
  }
}