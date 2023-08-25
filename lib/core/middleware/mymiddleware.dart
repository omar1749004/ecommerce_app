import 'package:e_commerce_app/views/screen/auth/login_page.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

import '../../views/screen/home.dart';
import '../services/services.dart';

class MyMiddleWare  extends GetMiddleware
{
  int? get priority => 1;
  MyServices myServices = Get.find();  //علشان عاملين  put
  @override
  RouteSettings? redirect(String? route) {
    
      if(myServices.sharedPreferences.getString("step")=="2")
    {
      
      return RouteSettings(name: HomePage.homepageId);
    }
    if(myServices.sharedPreferences.getString("step")=="1")
    {
      return RouteSettings(name: LoginPage.loginId);
    }
    
    else return null;
  }
}