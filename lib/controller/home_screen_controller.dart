import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/views/screen/home.dart';

import 'package:e_commerce_app/views/screen/notifi_page.dart';
import 'package:e_commerce_app/views/screen/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController
{
  changePage(int currentPage);
  changeColor(int i);

}

class HomeScreenControllerImp extends HomeScreenController
{
   bool active =false;
   Color acivecolor =Colors.black;
  int currentPage =0;
   List<Widget> listPage =[
    const HomePage(),
    Center(child: Text("Profile")),
    NotificationPage(),
    Settings(),
   ];
    List<Map> bottomAppBar=[
      {
        "title"  : "home",
        "icon"   :Icons.home
      },
      {
        "title"  : "profile",
        "icon"   :Icons.person_pin_sharp
      },
      
      {
        "title"  : "favorite",
        "icon"   :Icons.notifications_active_outlined
      },{
        "title"  : "setting",
        "icon"   :Icons.settings
      },
      
     
    ];
  @override
  changePage(int i) {
    currentPage =i;
     
     update();
  }
  
  @override
  changeColor(int i) {
    
    return i ==currentPage ?ColorApp.KPrimaryColor :Colors.grey[800];
     
  }

}