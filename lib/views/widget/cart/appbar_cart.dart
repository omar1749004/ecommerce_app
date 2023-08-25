import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarCart extends StatelessWidget {
  const AppBarCart({super.key, required this.title});
  final String title ;
  @override
  Widget build(BuildContext context) {
    return  Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                   Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: (){
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
            );
  }
}