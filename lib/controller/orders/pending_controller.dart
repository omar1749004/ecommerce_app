 import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/core/functions/checkinternet.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/models/orders_model.dart';
import 'package:e_commerce_app/data/service/remote/orsers/pending_data.dart';
import 'package:get/get.dart';

abstract class PendingOrdersController extends GetxController
{

  view();
}
class PendingOrdersControllerImp extends PendingOrdersController
{

  MyServices myServices =Get.find();
  late StatusRequst statusRequs;
  List<OrdersModels> data =[];
  String printOrderType(int val){
    return val == 0? "Delivery" : "Recive" ;
  }
  String printOrderPaymentMethod(int val){
    return val == 0? "Cash On Delivery" : "Payment Card" ;
  }
   String printOrderStatuse(int val){
    if(val == 0)
    {
      return "Await Approval";
    }
    else if(val == 1){
       return "The Order is bening Prepare";
    }
    else if(val == 2){
       return "On The way";
    }else{
      return "Archive";
    }

  }
  
  


   @override
     view() async{
   
     statusRequs = StatusRequst.loading;
      update();
      
  if(await checkinternet() )
  {   
    
     var res = await PendingOrdersData().getData(
      myServices.sharedPreferences.getString("id")!);
     
      if(res == null)
      {
        
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {
      List osrder =res["data"];
      data.clear();
      data.addAll(osrder.map((e) => OrdersModels.fromJson(e)));
      statusRequs =StatusRequst.sucsess;
      
     }else{
      statusRequs = StatusRequst.sucsess;
     }  
    }
   update(); 
  
  }
   deleteOrder(int orderid) async{
   
     statusRequs = StatusRequst.loading;
      update();
      
  if(await checkinternet() )
  {   
    
     var res = await PendingOrdersData().deleteData(
      orderid.toString()
      );
     
      if(res == null)
      {
        
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {
      data.removeWhere((element) => element.ordersId ==orderid );
      update(); 
      statusRequs =StatusRequst.sucsess;
      
     }else{
      statusRequs = StatusRequst.sucsess;
     }  
    }
   update(); 
  
  }
  refreshOrder(){
    view();
  }
  @override
  void onInit() {
    
    view();
    super.onInit();
  }
  
}