import 'package:flutter/material.dart';

class TopCart extends StatelessWidget {
  const TopCart({super.key, required this.count});
  final int count ;
  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 138, 60, 255)),
                child: Text("you have $count item in your list",textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                ),
            );
  }
}