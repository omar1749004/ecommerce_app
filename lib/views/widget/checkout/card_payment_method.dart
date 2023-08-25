import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethod extends StatelessWidget {
  const CardPaymentMethod({super.key, required this.text, required this.isActive});
 final String text;
 final bool isActive ;
  @override
  Widget build(BuildContext context) {
    return  Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          
        decoration: BoxDecoration(
          color:isActive == true ? ColorApp.secondColor :Color.fromARGB(255, 202, 184, 252),
          borderRadius: BorderRadius.circular(20)
          ),
          child: Text(
            text,style: TextStyle(
              color:isActive == true ? Colors.white:ColorApp.secondColor,
              fontWeight: FontWeight.bold)),
        );
  }
}