import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/service/static/static.dart';
import 'package:e_commerce_app/views/screen/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class OnBoeardingController extends GetxController
{
   next();
   onChanged(int index);
}
class OnBoardingControllerImp extends OnBoeardingController
{
  late PageController pageController;
  int currentpage =0;
  MyServices myServices = Get.find();  //علشان عاملين  put
  @override
  next() {
    currentpage ++;
    if(currentpage> onBoardingList.length-1)
    {
      
     myServices.sharedPreferences.setString("step", "1"); //for language
     
      Get.offAllNamed(LoginPage.loginId);
    }
    else{
         pageController.animateToPage(
      currentpage, duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
    
      
  }

  @override
  onChanged(int index) {
    currentpage=index;
    update();
  }
  @override
  void onInit() {
    pageController =PageController();
    super.onInit();
  }
}