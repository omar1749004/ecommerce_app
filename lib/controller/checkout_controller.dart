

import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/core/functions/checkinternet.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/models/addres_model.dart';
import 'package:e_commerce_app/data/service/remote/address_data.dart';
import 'package:e_commerce_app/data/service/remote/checkout_data.dart';
import 'package:e_commerce_app/data/service/remote/paymob/paymob_manager.dart';
import 'package:e_commerce_app/views/screen/home.dart';
import 'package:e_commerce_app/views/widget/checkout/payment_bottom_sheet.dart';

import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class CheckoutController extends GetxController{


}
class CheckoutControllerImp extends CheckoutController
{
  
  String? paymentMethod ;
  String? deliveryType ;
  int? paymentIndex ;
  int addressid = 0;
  List<AddresModels> dataAdress =[];
  MyServices myServices  =Get.find();
   StatusRequst statusRequs =StatusRequst.non;
   String copounid ="0";
   String discoundCoupon ="0";
  late String priceorder ;
   
     selectPayMethod(int val){
    paymentIndex =val ;
    update();
  }
  chousePaymentMethod(String val)
  {
     paymentMethod =val ;
     update();
  }
  chouseDeliveryType(String val)
  {
    deliveryType =val;
    update();
  }
  chouseAddressid(int val)
  {
    addressid =val;
    update();
  }
  getShippingAddress()async
  {
   
     statusRequs = StatusRequst.loading;
      update();
      
  if(await checkinternet() )
  {   
    
     var res = await AddressData().getadress(
      myServices.sharedPreferences.getString("id")!);
    
      if(res == null)
      {
        
        statusRequs = StatusRequst.failure;
        update(); 
        
      }
     else if(res["status"] =="success")
     {
       
      for(int i =0;i< res["data"].length;i++)
      {
           dataAdress.add(AddresModels.fromjsone(res["data"][i]) );
      }
         
      statusRequs =StatusRequst.sucsess;
      
     }else{
      
      statusRequs =StatusRequst.sucsess;
     }  
    }
   update(); 
  }

 cheackout()async{
    
      
  if(await checkinternet() )
  {   
    if(paymentMethod == null )
    {
        return Get.snackbar("woring", "please chouse payment methode");
    }
     if(deliveryType == null )
     {
       return Get.snackbar("woring", "please chouse order type");
     }
    
     if(deliveryType == "0" &&  addressid== 0) 
     { 
        return Get.snackbar("woring", "please chouse address");
     }
   
    
   if(paymentMethod != "0"){
        
     paymentBotoomSheet(() async{
      if(paymentIndex == null) {
        print("hello");
      }else{
        statusRequs =StatusRequst.loading;
        String paymentKey = await PaymobManger().getPaymentkeyFristThreeStep(10, "EGP") ;
        if(paymentKey == "error"){
          statusRequs = StatusRequst.failure;
        }else {
          if(paymentIndex == 0){
             statusRequs =StatusRequst.sucsess;
          
             payCard(paymentKey) ;
          }else{
             statusRequs =StatusRequst.sucsess;
             
             String url = await PaymobManger().mobileWallets(authToken: paymentKey) ;
             payWallet(url) ;
          }
         
        } 
      }
     }) ;
  //   statusRequs =StatusRequst.sucsess;
  // update(); 

    }
else{
  
     var res = await CheckoutData().checkout(
      {
        "userid" : myServices.sharedPreferences.getString("id"),
        "addressid" :  addressid.toString() ,
        "orderstype" :  deliveryType ,
        "pricedelivery" :  "10" ,
        "ordersPrice" : priceorder  ,
        "couponid" : copounid  ,
        "discoundCoupon" :discoundCoupon,
        "paymentmethod" : paymentMethod  ,
      }
      );
      
      if(res == null)
      {
        
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {
       
     Get.offAllNamed(HomePage.homepageId);
         Get.snackbar("message", "order added success");
      statusRequs =StatusRequst.sucsess;
      
     }else{
      Get.snackbar("woring", "please try agine");
      statusRequs = StatusRequst.non;
     }  
     
     update(); 
   
  }

  }
  
 }



  @override
  void onInit() {
    copounid = Get.arguments["cpouponid"].toString();
    priceorder = Get.arguments["priceorder"];
    discoundCoupon =Get.arguments["discoundCoupon"];
   getShippingAddress();
    super.onInit();
  }


//paymob

//card
Future<void> payCard(String paymentKey)async{
  launchUrl(

    Uri.parse("https://accept.paymob.com/api/acceptance/iframes/798983?payment_token=$paymentKey")
  );
}
// Mobile Wallets
Future<void> payWallet(String url)async{
  
  launchUrl(

    Uri.parse(url) 
  );
}
  paypalCheckout(){
     PaypalCheckout(
                sandboxMode: true,
                clientId: "ATTKK3s-dFeKdTAzNuTJa_aoYr7FD0IK_ir7IN5isyt94e8muqAwdfWeGExbrEilNTUbGlskv4CHg6WQ",
                secretKey: "EOVdYoT2cd-EuXimOgHaYoJKMWkHxTLHKLj8pGAEKO0UgtT3_CMMtWRlDD3J1DBPGDyAWkRxicxldpXu",
                returnURL: "success.snippetcoder.com",
                cancelURL: "cancel.snippetcoder.com",
                transactions: const [
                  {
                    "amount": {
                      "total": '70',
                      "currency": "USD",
                      "details": {
                        "subtotal": '70',
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                    "item_list": {
                      "items": [
                        {
                          "name": "Apple",
                          "quantity": 4,
                          "price": '5',
                          "currency": "USD"
                        },
                        {
                          "name": "Pineapple",
                          "quantity": 5,
                          "price": '10',
                          "currency": "USD"
                        }
                      ],

                      // shipping address is not required though
                      //   "shipping_address": {
                      //     "recipient_name": "Raman Singh",
                      //     "line1": "Delhi",
                      //     "line2": "",
                      //     "city": "Delhi",
                      //     "country_code": "IN",
                      //     "postal_code": "11001",
                      //     "phone": "+00000000",
                      //     "state": "Texas"
                      //  },
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                 
                },
                onError: (error) {
                  print("onError: $error");
                  
                },
                onCancel: () {
                 
                },
              );
  }

}