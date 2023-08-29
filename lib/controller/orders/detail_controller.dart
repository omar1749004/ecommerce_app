import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/core/functions/checkinternet.dart';
import 'package:e_commerce_app/data/models/cart_model.dart';
import 'package:e_commerce_app/data/models/orders_model.dart';
import 'package:e_commerce_app/data/service/remote/orsers/details.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController
{
  late OrdersModels ordersModels;
   late StatusRequst statusRequs;
  List<CartModel> data =[];
   view() async{
   
     statusRequs = StatusRequst.loading;
      update();
      
  if(await checkinternet() )
  {   
    
     var res = await DetailsOrdersData().getData(
      ordersModels.ordersId.toString());
     
      if(res == null)
      {
        
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {
      List osrder =res["data"];
      data.clear();
      data.addAll(osrder.map((e) => CartModel.fromjsone(e)));
      statusRequs =StatusRequst.sucsess;
      
     }else{
      statusRequs = StatusRequst.sucsess;
     }  
    }
   update(); 
  
  }
  @override
  void onInit() {
    view();
    ordersModels =Get.arguments["ordersModel"];
    super.onInit();
  }
}