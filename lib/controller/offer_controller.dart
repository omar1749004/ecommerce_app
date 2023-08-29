import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/core/functions/checkinternet.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/models/item_model.dart';
import 'package:e_commerce_app/data/service/remote/offers_data.dart';
import 'package:get/get.dart';

class OffersController extends GetxController
{
    List<ItemsModel> items =[];
    late StatusRequst statusRequs;
     MyServices myServices = Get.find(); 

   getItems() async{
    items.clear();
     statusRequs = StatusRequst.loading;
      update();
      
  if(await checkinternet() )
  {   
    
     var res = await OffersData().getData(
      myServices.sharedPreferences.getString("id")!
     );
   
    
      if(res == null)
      {
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {

      List itemlist =res["data"] ;
      items.addAll(itemlist.map((e) => ItemsModel.fromjsone(e)));
      
      statusRequs =StatusRequst.sucsess;

     }else{
      
      statusRequs = StatusRequst.failure;
      
     }  
    }
   update(); 
  }
  @override
  void onInit() {
    getItems();
    super.onInit();
  }
}