import 'package:e_commerce_app/data/service/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statuscode.dart';
import '../core/functions/checkinternet.dart';
import '../core/services/services.dart';

abstract class FavoriteController extends GetxController
{
   setFavorite(int id ,int  val) ;
   addFavorite(String itemId);
   deletefavorite(String itemId);
}
class FavoriteControllerImp extends FavoriteController
{

   late StatusRequst statusRequs;
   MyServices myServices =Get.find();
  Map isFavorite ={};
  // key = id
  //value = is fav or no
  @override
  setFavorite(id , val) 
  {
      isFavorite[id] =val;
      update();
  }
  
  @override
  addFavorite(itemId)async {
    if(await checkinternet() )
  {   
       
      
     var res = await FavoritData().addFavorite(
        itemId ,myServices.sharedPreferences.getString("id")!);
    
      if(res == null)
      {
        
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {

     
       Get.rawSnackbar(title: "notfy" ,messageText: Text("item  is added from favorite"));
      statusRequs =StatusRequst.sucsess;

     }else{
      
      statusRequs = StatusRequst.failure;
      

     
     }  
    }
  }
  
  @override
  deletefavorite(itemId) async {
    if(await checkinternet() )
  {   
    
     var res = await FavoritData().deleteFavorite(
        itemId,myServices.sharedPreferences.getString("id")!);
    
      if(res == null)
      {
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {
 
       Get.rawSnackbar(title: "notfy" ,messageText: Text("item  is removed from favorite"));
      
      statusRequs =StatusRequst.sucsess;

     }else{
      
      statusRequs = StatusRequst.failure;

     }  
    } 
  }


}