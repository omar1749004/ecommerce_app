import 'package:e_commerce_app/controller/on_boarding_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/constant/color.dart';
import '../../../data/service/static/static.dart';

class CusttomControler extends StatelessWidget {
  const CusttomControler({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller){
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ...List.generate(
        onBoardingList.length,
        (index) => AnimatedContainer(
          duration:const Duration(
            milliseconds: 200,
          ),
          margin:const EdgeInsets.only(right: 5),
          width: controller.currentpage ==index ?20 :5,
          height: 6,
          decoration: BoxDecoration(
              color: ColorApp.KPrimaryColor,
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
      
    ]);
    });
  }
}
