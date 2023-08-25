import 'package:e_commerce_app/views/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/localization/change_lacal.dart';
import '../widget/language/custome_bottone_lang.dart';

class LanguagePage extends GetView<LocalController> {
  const LanguagePage({super.key});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr,style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
             ),),
            SizedBox(height: 20,),
          CustomeBottoneLang(langName: "عربي", onPressed: () {
           controller.changeLang("ar");
           Get.offNamed(OnBoarding.onboardingId);
           },),
          CustomeBottoneLang(langName: "English", onPressed: () { 
            controller.changeLang("en");
            Get.offNamed(OnBoarding.onboardingId);
          },),
        ],),
      ),
    );
  }
}