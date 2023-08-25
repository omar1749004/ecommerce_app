import 'package:flutter/material.dart';

class CustomeTitleAuth extends StatelessWidget {
  const CustomeTitleAuth({super.key, required this.title});
  final String title ;
  @override
  Widget build(BuildContext context) {
    return  Text(title,
           textAlign: TextAlign.center,
           style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30
           ),
           );
  }
}