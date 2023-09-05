import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/core/functions/checkinternet.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/service/remote/notify_data.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController
{
 
  late StatusRequst statusRequs;
  MyServices myServices = Get.find();  
    List data = [];
getData()async
{
  statusRequs = StatusRequst.loading;
  
  if(await checkinternet() )
  {   
    
     var res = await NotifyData().getData(
      myServices.sharedPreferences.getString("id")!
     );
     if(res["status"] =="failure")
     {
       statusRequs =StatusRequst.sucsess;
     }else{
      print("hello");
      statusRequs =StatusRequst.sucsess;
      for(int i =0;i< res["data"].length;i++)
      {
           data.add(res["data"][i]) ;
      }
      
     }
     
  }
  else {
    statusRequs =StatusRequst.offlineFailure;
  }
  update();
}

@override
  void onInit() {
    getData();//أفعل الميثود
    super.onInit();
  }
}