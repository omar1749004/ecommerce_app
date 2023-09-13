import 'package:e_commerce_app/controller/on_boarding_controler.dart';
import 'package:e_commerce_app/views/widget/onbording_widget/custom_botton.dart';
import 'package:e_commerce_app/views/widget/onbording_widget/custom_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

import '../widget/onbording_widget/customPadgeView.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
   static const String onboardingId = "/onBoarding";
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
         const Expanded(
            flex: 3, //مهم
            child:  CusttomPadgeView(),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CusttomControler(),
                  Spacer(
                    flex: 2,
                  ),
                  CustomeBotton(
                    
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ))
        ],
      ),
    ));
  }
}
