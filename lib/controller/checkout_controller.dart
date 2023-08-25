import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/core/functions/checkinternet.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/models/addres_model.dart';
import 'package:e_commerce_app/data/service/remote/address_data.dart';
import 'package:e_commerce_app/data/service/remote/checkout_data.dart';
import 'package:e_commerce_app/views/screen/home.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class CheckoutController extends GetxController{


}
class CheckoutControllerImp extends CheckoutController
{
  
  String? paymentMethod ;
  String? deliveryType ;
  int addressid = 0;
  List<AddresModels> dataAdress =[];
  MyServices myServices  =Get.find();
   StatusRequst statusRequs =StatusRequst.non;
   String copounid ="0";
   String discoundCoupon ="0";
  late String priceorder ;
   
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
        
      }
     else if(res["status"] =="success")
     {
       
      for(int i =0;i< res["data"].length;i++)
      {
           dataAdress.add(AddresModels.fromjsone(res["data"][i]) );
      }
         
      statusRequs =StatusRequst.sucsess;
      
     }else{
      
      statusRequs = StatusRequst.failure;
     }  
    }
   update(); 
  }

 cheackout()async
  {
     statusRequs = StatusRequst.loading;
      update();
      
  if(await checkinternet() )
  {   
    if(paymentMethod == null )
    return Get.snackbar("woring", "please chouse payment methode");
     if(deliveryType == null )
    return Get.snackbar("woring", "please chouse order type");
     if(deliveryType == "0" && addressid ==0)
    return Get.snackbar("woring", "please chouse order type");
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
    }
   update(); 
  }
  @override
  void onInit() {
    copounid = Get.arguments["cpouponid"].toString();
    priceorder = Get.arguments["priceorder"];
    discoundCoupon =Get.arguments["discoundCoupon"];
   getShippingAddress();
    super.onInit();
  }
}