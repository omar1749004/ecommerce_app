import 'package:e_commerce_app/controller/payment_details_controller.dart';
import 'package:e_commerce_app/core/constant/styles.dart';
import 'package:e_commerce_app/views/widget/cart/custom_cart_bottom.dart';
import 'package:e_commerce_app/views/widget/payment_details/cutom_credit_card.dart';
import 'package:e_commerce_app/core/shared/payment_method_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class PaymentDatails extends StatelessWidget {
  const PaymentDatails({super.key});
  static const String paymentDatailsId = "/paymentDatailsId";
  @override
  Widget build(BuildContext context) {
  PaymentDetailsComtrollerImp controller = Get.put(PaymentDetailsComtrollerImp());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Payment Details", style: Styles.style25),
        backgroundColor: Colors.grey[50],
      ),
      bottomNavigationBar: CustomCartBottom(
        text: "Payment",
        onPressed: () {
          controller.onPayment() ;
        },
      ),
      body: Padding(
        padding:const EdgeInsets.symmetric(vertical: 5),
        child: GetBuilder<PaymentDetailsComtrollerImp>(
          builder: (controller) => SingleChildScrollView(
            child: Column(
              children: [
              //  PaymentMethodsListView(),
                CutstomCreditCard(cardNumber: controller.cardNumber,
                 expiryDate: controller.expiryDate,
                  cardHolderName: controller.cardHolderName,
                   cvvCode: controller.cvvCode,
                   formKey: controller.formKey,
                   showBackView: controller.showBackView,
                   autovalidateMode : controller.autovalidateMode,
                   onCreditCardModel: (CreditCardModel creditCardModel) {
                     controller.onCreditCardModel(creditCardModel);
                   },
                   )
                ],
                ),
          ),
        ),
      ),
    );
  }
}

