import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryType extends StatelessWidget {
  const CardDeliveryType({super.key, required this.imageNmae, required this.title, required this.isActive});
  final String imageNmae;
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color:isActive == true? ColorApp.secondColor:null,
              border: Border.all(color: ColorApp.KPrimaryColor)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Image.asset(
              imageNmae,width: 60,
              
              ),
            Text(title,style: TextStyle(
              color:isActive == true? Colors.white : ColorApp.secondColor,fontWeight: FontWeight.bold,height: 2),)
          ]),);
  }
}