import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardAdress extends StatelessWidget {
  const CardAdress({super.key, required this.title, required this.body, required this.isActive});
 final String title;
 final String body;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Card(
            color: isActive ==true ? ColorApp.secondColor :null,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child:  ListTile(
            title: Text(
              title,
              style: TextStyle(
                color:isActive ==true ? Colors.white: null,
                fontWeight: FontWeight.bold),),
            subtitle: Text(
              body,
              style: TextStyle(color:isActive ==true ? Colors.white:null)),
            ),);
  }
}