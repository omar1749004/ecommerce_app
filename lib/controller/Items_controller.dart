import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/service/remote/items_data.dart';
import 'package:e_commerce_app/views/screen/product_details.dart';
import 'package:get/get.dart';

import '../core/class/statuscode.dart';
import '../core/functions/checkinternet.dart';
import '../data/models/item_model.dart';
import 'home_controller.dart';

abstract class ItemsController extends SearchMixController
{
   initialData();
   changeCat(int val,String id);
   getItems();
   gotoProductDetails(ItemsModel itemsModel);
}
class ItemsControllerImp extends ItemsController 
{
  List categories = [];
  int? selectCar;
  String? categoriyId;
   late StatusRequst statusRequs;
   List<ItemsModel> items =[];
  MyServices myServices =Get.find();
  String time  = ""  ;

@override
  void onInit() {
    initialData();
    
    super.onInit();
  }
   @override
  initialData() {
   time = myServices.sharedPreferences.getString("deliveryTime")! ;
   categories = Get.arguments["categories"];
   selectCar = Get.arguments["selectedCat"];
   categoriyId = Get.arguments["categoryId"];
   getItems();

  }
  @override
  changeCat(val,id) {
    selectCar =val;
     categoriyId =id;
     getItems();  //re recive data
 
  }
  
  @override
  getItems() async{
    items.clear();
     statusRequs = StatusRequst.loading;
      update();
      
  if(await checkinternet() )
  {   
    
     var res = await ItemsData().getData(
      categoriyId!,myServices.sharedPreferences.getString("id")!);
    
      if(res == null)
      {
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {

      for(int i =0;i< res["data"].length;i++)
      {
           items.add(ItemsModel.fromjsone(res["data"][i]) );
      }
      
      statusRequs =StatusRequst.sucsess;

     }else{
      
      statusRequs = StatusRequst.failure;
      

     
     }  
    }
   update(); 
  }
  
  @override
  gotoProductDetails(ItemsModel) {
    Get.toNamed(ProductDetails.productDetailsId,arguments: {
        "itemsModel"  : ItemsModel
    });
  }

}