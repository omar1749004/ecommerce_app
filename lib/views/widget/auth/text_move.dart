import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class TextMove extends StatelessWidget {
  const TextMove({super.key, required this.text, required this.text2, this.ontap});
  final String text ;
  final String text2 ;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    text2,
                    style: TextStyle(color: ColorApp.gray),
                  ),
                  GestureDetector(
                    onTap:ontap,
                    child:  Text(
                      text,
                      style: TextStyle(color: ColorApp.KPrimaryColor)
                    ),
                  )
                ],
           );
  }
}