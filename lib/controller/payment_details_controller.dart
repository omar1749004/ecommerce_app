import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/views/screen/success_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

abstract class PaymentDetailsComtroller extends GetxController{

}
class PaymentDetailsComtrollerImp extends PaymentDetailsComtroller{
  
  String? deliveryType ;
  String? addressid ;
  MyServices myServices  =Get.find();
  StatusRequst statusRequs =StatusRequst.non;
  String copounid ="0";
  String discoundCoupon ="0";
  late String priceorder ;
  int? paymentMethod ;
  //card details
  String  cardNumber ='' ,expiryDate ='' ,cardHolderName = '' ,cvvCode ='' ;
  bool  showBackView = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
   AutovalidateMode autovalidateMode = AutovalidateMode.disabled ;

  void onCreditCardModel(CreditCardModel creditCardModel) 
  {
    cardNumber = creditCardModel.cardNumber ;
    expiryDate = creditCardModel.expiryDate ;
    cardHolderName = creditCardModel.cardHolderName ;
    cvvCode = creditCardModel.cvvCode ;
    showBackView =creditCardModel.isCvvFocused ;
    update();
  }
  onPayment(){
    if(formKey.currentState!.validate())
    {
      formKey.currentState!.save() ;
       Get.toNamed(SuccessPayment.successPaymentId,arguments: {
        "addressid" :  addressid ,
        "orderstype" :  deliveryType ,
        "pricedelivery" :  "10" ,
        "ordersPrice" : priceorder  ,
        "copounid" : copounid  ,
        "discoundCoupon" :discoundCoupon,
        "paymentmethod" : paymentMethod  ,
      });
    }else{
      Get.toNamed(SuccessPayment.successPaymentId,arguments: {
        "addressid" :  addressid ,
        "orderstype" :  deliveryType ,
        "pricedelivery" :  "10" ,
        "ordersPrice" : priceorder  ,
        "copounid" : copounid  ,
        "discoundCoupon" :discoundCoupon,
        "paymentmethod" : paymentMethod  ,
      });
      autovalidateMode = AutovalidateMode.always ;
     
    }
    update();
  }
  selectPayMethod(int val){
    paymentMethod =val ;
    update();
  }

  @override
  void onInit() {
    deliveryType = Get.arguments["orderstype"];
    addressid = Get.arguments["addressid"];
    priceorder = Get.arguments["ordersPrice"];
    discoundCoupon = Get.arguments["discoundCoupon"];
    copounid = Get.arguments["copounid"];
   
    discoundCoupon =Get.arguments["discoundCoupon"];
    super.onInit();
  }
}