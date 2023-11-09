import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CutstomCreditCard extends StatelessWidget {
  const CutstomCreditCard({super.key, required this.cardNumber, required this.expiryDate, required this.cardHolderName, required this.cvvCode, required this.formKey, required this.onCreditCardModel, required this.showBackView, required this.autovalidateMode});
final   String  cardNumber ,expiryDate ,cardHolderName ,cvvCode ;
final  bool  showBackView ;
final GlobalKey<FormState> formKey ;
final void Function(CreditCardModel) onCreditCardModel ;
final AutovalidateMode autovalidateMode ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
           expiryDate: expiryDate, 
           cardHolderName: cardHolderName, 
           cvvCode: cvvCode,
            showBackView: showBackView,
            isHolderNameVisible: true,
             onCreditCardWidgetChange: (value){}),
            
             CreditCardForm(cardNumber: cardNumber,
              expiryDate: expiryDate, 
              cardHolderName: cardHolderName,
               cvvCode: cvvCode,
                onCreditCardModelChange:  onCreditCardModel,    //البيانات اللي بيدخلها
                   autovalidateMode: autovalidateMode,
                
                 formKey: formKey)
      ],
    );
  }

}