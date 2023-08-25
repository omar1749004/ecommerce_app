import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/on_boarding_controler.dart';
import '../../../core/constant/color.dart';
import '../../../data/service/static/static.dart';

class CusttomPadgeView extends GetView<OnBoardingControllerImp> {
  const CusttomPadgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return   PageView.builder(
      controller: controller.pageController,
      onPageChanged :(value) => controller.onChanged(value),
          itemCount: onBoardingList.length,
          itemBuilder: (context ,i){
          return Column(children: [
           Padding(
             padding: const EdgeInsets.only(top: 20),
             child: Text(onBoardingList[i].title!,style:const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
             ),),
           ),
           const SizedBox(height: 80,),
           Image.asset(onBoardingList[i].image!,
           width: 200,
           height: 220,
           fit: BoxFit.fill,
           ),
           const SizedBox(height: 80,),
           Container(width: double.infinity,
           alignment: Alignment.center,
            child: Text(onBoardingList[i].body!,textAlign: TextAlign.center,
            style:const TextStyle(height: 2,
            color: ColorApp.gray,fontWeight: FontWeight.bold,
            
            fontSize: 15
            ),),)
          ],);
               },);
        
  }
}