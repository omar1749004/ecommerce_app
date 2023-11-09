import 'package:e_commerce_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({super.key, required this.left, required this.right});
  final String left, right;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left, textAlign: TextAlign.center, style: Styles.style18black),
        Text(right, style: Styles.style18B)
      ],
    );
  }
}
