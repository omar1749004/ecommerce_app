import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/service/remote/home_data.dart';
import 'package:e_commerce_app/views/screen/item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statuscode.dart';
import '../core/functions/checkinternet.dart';
import '../data/models/categories_model.dart';
import '../data/models/item_model.dart';
import '../views/screen/product_details.dart';
abstract class HomeContrller extends SearchMixController
{
  initialData();
  getData();
  gotoItems(int selectCat,String categoryId);
}
class HomeContrllerImp extends HomeContrller
{

  MyServices myServices =Get.find();
      String? lang ;
     List<CetegoriesModel> categories =[];
     List<ItemsModel> items =[];
     Map setting = {};
 late StatusRequst statusRequs;
    String titleNameCart ="" ;
    String bodyeNameCart = "";
    String delivryTime ="" ;
@override
  getData()async {
     statusRequs = StatusRequst.loading;
      update();
      await Future.delayed( Duration(seconds: 1)); //#############
  if(await checkinternet() )
  {   
    
    
     var res = await HomeData().getData();
    
      if(res == null)
      {
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {
    
       
      for(int i =0;i< res["categories"]["data"].length;i++)
      {
           categories.add(CetegoriesModel.fromjsone(res["categories"]["data"][i]) );
           
      }
      for(int i =0;i< res["items"]["data"].length;i++)
      {
           items.add(ItemsModel.fromjsone(res["items"]["data"][i]) );

      }
      setting = res["setting"]["data"][0] ;
      titleNameCart = setting["setting_title"];
      bodyeNameCart = setting["setting_body"];
      delivryTime = setting["setting_deliverytime"].toString();
      myServices.sharedPreferences.setString("deliveryTime", delivryTime);
      statusRequs =StatusRequst.sucsess;
      
     }else{
      
      statusRequs = StatusRequst.failure;
      
   
     
     }  
    }
   update(); 
  }

initialData(){
  lang =myServices.sharedPreferences.getString("lang");
  
}
   
  @override
  void onInit() {
    initialData();
    getData();
   
    super.onInit();

  }
  
  @override
  gotoItems(selectCat ,categoryId) {
   
    Get.toNamed(Items.itemsId , arguments: 
    {
      "categoryId" :categoryId,
      "categories" : categories,
       "selectedCat" : selectCat
    });
  }
  gotoProductDetails(ItemsModel itemsModel) {
    Get.toNamed(ProductDetails.productDetailsId,arguments: {
        "itemsModel"  : itemsModel
    });
  }
  
}
class SearchMixController extends GetxController{
   late StatusRequst statusRequs;
  List<ItemsModel> searchItem =[];
  TextEditingController? search;
 bool isSearch = false;
 
  checkSearch(String val)
  {
    if(val.isEmpty)
    {
      statusRequs = StatusRequst.non;
      isSearch =false;

    }
    else{
      isSearch =true;
      searchData();
    }
    update();
  }
 onsearchItem(){
  isSearch =true;
 
  update();
 }
 searchData()async {
     statusRequs = StatusRequst.loading;
      update();
      await Future.delayed( Duration(seconds: 1)); //#############
  if(await checkinternet() )
  {   
    
    
     var res = await HomeData().searchData(search!.text);
    
      if(res == null)
      {
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {
      searchItem.clear()
;      List<dynamic> resList =res["data"];
           searchItem.addAll(resList.map((e) => ItemsModel.fromjsone(e)) );
      
      statusRequs =StatusRequst.sucsess;
      
     }else{
      
      statusRequs = StatusRequst.failure;
      
    // data.addAll();
     
     }  
    }
   update(); 
  }
  @override
  void onInit() {
search =TextEditingController();
    super.onInit();
  }
}