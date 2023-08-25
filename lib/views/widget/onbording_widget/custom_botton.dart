import 'package:e_commerce_app/controller/on_boarding_controler.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomeBotton extends GetView<OnBoardingControllerImp> {
  const CustomeBotton({super.key,});
    
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.next();
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.KPrimaryColor ,
          borderRadius: BorderRadius.circular(8)
        ),
        width: 250,
        height: 45,
        child: Center(child: Text("Continue",
        style: TextStyle(color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500
        ),
        ),),
        ),
    );
  }
}