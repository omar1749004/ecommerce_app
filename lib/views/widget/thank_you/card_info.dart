import 'package:e_commerce_app/core/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SvgPicture.asset("asset/image/creditLogo.svg"),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Credit Card  ', style: Styles.style18black),
              TextSpan(
                text: 'Mastercard **78 ',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.699999988079071),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10,)
      ]),
    );
  }
}

