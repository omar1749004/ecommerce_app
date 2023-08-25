import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/core/functions/checkinternet.dart';
import 'package:e_commerce_app/data/service/remote/test.dart';
import 'package:get/get.dart';



class TestController extends GetxController
{
  TestData test = TestData(Get.find());

  List data = [];

 late StatusRequst statusRequs;
getData()async
{
  statusRequs = StatusRequst.loading;
  
  if(await checkinternet() )
  {   
    print("hello");
     var res = await test.getData();
     if(res["status"] =="failure")
     {
      statusRequs = StatusRequst.failure;
     }else{
      statusRequs =StatusRequst.sucsess;
     data.addAll(res["data"]);
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