import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool>alertExiteApp(){
   Get.defaultDialog(
    title :"Woring",
    middleText: "Do You Want Exit App", 
    actions: [
      ElevatedButton(onPressed: (){
        exit(0);
      }, child: Text("Yes")),
      ElevatedButton(onPressed: (){
        Get.back();
      }, child: Text("No"))
    ]
  );
   return Future.value(true);
}