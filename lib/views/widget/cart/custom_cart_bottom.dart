import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomCartBottom extends StatelessWidget {
  const CustomCartBottom({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
       width: double.infinity,
        margin: EdgeInsets.all(10),
        child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: ColorApp.KPrimaryColor,
            textColor:  Colors.white,
            child: Text(
              text,
              style: TextStyle( fontSize: 18),
            ),
            onPressed: onPressed),
      );
  }
}