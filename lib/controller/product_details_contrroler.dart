import 'package:e_commerce_app/data/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statuscode.dart';
import '../core/functions/checkinternet.dart';
import '../core/services/services.dart';
import '../data/service/remote/cart_data.dart';
import '../views/screen/cart_page.dart';

abstract class ProductDetailsController extends GetxController
{
   initialData();
}
class ProductDetailsControllerImp extends ProductDetailsController
{
   late StatusRequst statusRequs;
   late ItemsModel itemsModel;
   int countItems = 0;
   MyServices myServices =Get.find();
 
  List supItems =[
  { "name" : "red",
     "id" : 1,
     "active" : 1,
  },
  { "name" : "black",
     "id" : 2,
     "active" : 0,
  },
   { "name" : "blue",
     "id" : 3,
     "active" : 1,
  }
  ];
   addItems(itemId) async{
    statusRequs = StatusRequst.loading;
     update();
     if(await checkinternet() )
  {   
       
      
     var res = await CartData().addCart(
        itemId ,myServices.sharedPreferences.getString("id")!);
    
      if(res == null)
      {
       
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {

     
       Get.rawSnackbar(title: "notfy" ,messageText: Text("item  is added to Cart"));
      statusRequs =StatusRequst.sucsess;

     }else{
      
      statusRequs = StatusRequst.failure;
      

     
     }  
    }
    update();
  }
  add(){
   countItems ++;
   addItems(itemsModel.itemId.toString());
   update();
  }

  deleteItrems(itemId) async{
   
    statusRequs = StatusRequst.loading;
     update();
      if(await checkinternet() )
  {   
    
     var res = await CartData().deleteCart(
        itemId,myServices.sharedPreferences.getString("id")!);
    
      if(res == null)
      {
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {
 
       Get.rawSnackbar(title: "notfy" ,messageText:const Text("item  is removed from Cart"));
      
      statusRequs =StatusRequst.sucsess;

     }else{
      
      statusRequs = StatusRequst.failure;

     }  
    } 
    update();
  }
  delete(){
 if(countItems > 0)
 { 
    countItems -- ;
    deleteItrems(itemsModel.itemId.toString());
    update();
 }
  }
   
  getcount(String itemId) async{
    if(await checkinternet() )
  {   
    
     var res = await CartData().getCountCart(
        itemId,myServices.sharedPreferences.getString("id")!);
    
      if(res == null)
      {
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {
      int count = 0;
       statusRequs =StatusRequst.sucsess;
       count =  res["data"];     
      return count;
     

     }else{
      
      statusRequs = StatusRequst.failure;
      

     
     }  
    } 
    update();
  }
   initialData()async{
    statusRequs =StatusRequst.loading;
    itemsModel =Get.arguments["itemsModel"];
   countItems = await getcount(itemsModel.itemId.toString());
        statusRequs =StatusRequst.sucsess;
        update();

  }
  @override
  void onInit() {
    initialData();
    super.onInit();
  }
  
  gotoProductDetails() {
  Get.toNamed(Cart.cartId);
  }
}