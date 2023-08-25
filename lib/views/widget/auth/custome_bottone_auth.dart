import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomBottoneAuth extends StatelessWidget {
  const CustomBottoneAuth({super.key, this.ontap, required this.text});
  final Function()? ontap;
  final String text ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
       
        decoration: BoxDecoration(
          color: ColorApp.KPrimaryColor ,
          borderRadius: BorderRadius.circular(16)
        ),
        width: 250,
        height: 50,
        child: Center(child: Text(text,
        style: TextStyle(color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500
        ),
        ),),
        ),
    );
  }
}