import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomeTextBodyAuth extends StatelessWidget {
  const CustomeTextBodyAuth({super.key, required this.body,  this.hight =1.5});
  final String body ;
  final double hight;
  @override
  Widget build(BuildContext context) {
    return Text(body,

           textAlign: TextAlign.center,
           style: TextStyle(
           height: hight,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: ColorApp.gray
           ),
           );
  }
}