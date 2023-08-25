import 'package:e_commerce_app/data/models/cart_model.dart';
import 'package:e_commerce_app/data/models/coupon_model.dart';
import 'package:e_commerce_app/data/service/remote/cart_data.dart';
import 'package:e_commerce_app/views/screen/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statuscode.dart';
import '../core/functions/checkinternet.dart';
import '../core/services/services.dart';


abstract class CartController extends GetxController{
   add(String itemId);
   delete(String itemId);

   view();
   resetVarCart();
 
}
class CartControllerImp extends CartController
{

    late StatusRequst statusRequs;
    List<CartModel> items =[];
    String totalprice ="0.0";
    String totalcount ="0";
    CouponModels? couponModel;
   MyServices myServices =Get.find();
   TextEditingController? coupon;
   int discoundCoupon = 0;
   String? couponName ;
   int? copounid ;
  @override
  void onInit() {
    view();
    coupon =TextEditingController();
    super.onInit();
  }
  @override
  add(itemId) async{
    
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
       refresgPage();
      statusRequs =StatusRequst.sucsess;
        
     }else{
      
      statusRequs = StatusRequst.failure;
      

     
     }  
    }
    update();
  }
  resetVarCart()
  {
    totalcount ="0";
    totalprice = "0";
    items.clear();
  }
  refresgPage()async{
    resetVarCart();
   await view();
  }


  checkCoupon()async{
   statusRequs = StatusRequst.loading;
     update();
      if(await checkinternet() )
  {   
    
     var res = await CartData().checkCoupon(
        coupon!.text);
    
      if(res == null)
      {
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {
      
      couponModel = CouponModels.fromJson(res["data"]);
      discoundCoupon =couponModel!.couponDiscound;
      couponName =couponModel!.couponName;
      statusRequs =StatusRequst.sucsess;
       copounid =couponModel!.couponId;
     }else{
        copounid =null;
        couponName =null;
        Get.snackbar("worning", "Coupon not vaild");
      statusRequs =StatusRequst.sucsess;
    
     }  
    } 
    update();
   }
    gotoPagecheckout(){
      if(items.isEmpty)
      return Get.snackbar("woring", "cart empty");
     Get.toNamed(CheckOut.checkOutid,arguments: {
      "cpouponid" :copounid?? "0",
      "priceorder" :totalprice,
      "discoundCoupon" :discoundCoupon.toString()

     });
  }
  @override
  delete(itemId) async{
   
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
       refresgPage();
       Get.rawSnackbar(title: "notfy" ,messageText: Text("item  is removed from Cart"));
      
      statusRequs =StatusRequst.sucsess;

     }else{
      
      statusRequs = StatusRequst.failure;

     }  
    } 
    update();
  }
  gettotalPrice(){
   return double.parse(totalprice) -double.parse(totalprice)* discoundCoupon /100;
  }
  @override
  view() async{
    
     statusRequs = StatusRequst.loading;
      update();
      
  if(await checkinternet() )
  {   
    
     var res = await CartData().viewCart(
      myServices.sharedPreferences.getString("id")!);
    
      if(res == null)
      {
        
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["all"]["status"] =="success")
     {
       items.clear();
      for(int i =0;i< res["all"]["data"].length;i++)
      {
           items.add(CartModel.fromjsone(res["all"]["data"][i]) );
      }
      totalprice = res["countprice"]["totalprice"].toString();
      totalcount =res["countprice"]["totalcount"];
      statusRequs =StatusRequst.sucsess;
      
     }else{
      
      statusRequs = StatusRequst.sucsess;
     }  
    }
   update(); 
  
  }
}