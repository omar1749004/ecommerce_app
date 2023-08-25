import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomeBottoneLang extends StatelessWidget {
  const CustomeBottoneLang({super.key, required this.langName, this.onPressed});
  final String langName;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: EdgeInsets.symmetric(horizontal: 100),
            width: double.infinity,
           child: MaterialButton(
            color : ColorApp.KPrimaryColor,
            onPressed: onPressed,
           textColor: Colors.white,
           child: Text(langName,style: TextStyle(fontWeight: FontWeight.bold),),
           ),);
  }
}
//"عربي"