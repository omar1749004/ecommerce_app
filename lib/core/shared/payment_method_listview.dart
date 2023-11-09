
import 'package:e_commerce_app/controller/checkout_controller.dart';
import 'package:e_commerce_app/core/shared/payment_detailsmethod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PaymentMethodsListView extends GetView<CheckoutControllerImp> {
  const PaymentMethodsListView({super.key,});
final  List<String> paymentMethodItem = const[
  "asset/image/SVGRepo_iconCarrier.svg",
  "asset/image/paypal.svg",
  "asset/image/applePay.svg"
] ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: paymentMethodItem.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,i) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: InkWell(
          onTap:() {
            controller.selectPayMethod(i) ;
          } ,
          child:GetBuilder<CheckoutControllerImp>(builder: (controller){
            return PaymentDetailsMethode(image: paymentMethodItem[i],
          isActive: controller.paymentIndex == i ?true : false,);
          }) 
          ),
      ),),
    );
  }
}