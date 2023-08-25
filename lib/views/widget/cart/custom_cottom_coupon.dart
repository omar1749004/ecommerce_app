import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomBottomCoupon extends StatelessWidget {
  const CustomBottomCoupon({super.key, required this.text, this.onPressed});
 final String text ;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
       // height: 45,
       width: double.infinity,
        //margin: EdgeInsets.all(10),
        child: MaterialButton(
            shape:
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)
                  )
                  ),
            color: ColorApp.KPrimaryColor,
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: onPressed),
      );
  }
}