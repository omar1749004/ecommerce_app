import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';
import 'custom_bottom_appbar.dart';

class CustomAppBar extends GetView<HomeScreenControllerImp> {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
               height: 80,
               padding: EdgeInsets.symmetric(vertical: 10),
              shape: CircularNotchedRectangle(),
              
              notchMargin: 12,
              
              child: Row(
                children: [
                  ...List.generate(controller.listPage.length + 1, (index) {
                    int i =index >2 ? index - 1 :index;
                    return index == 2
                        ?  Spacer() :
                             
                              CustommBottomAppBar(
                                  icon: controller.bottomAppBar[i]["icon"],
                                  text: controller.bottomAppBar[i]["title"],
                                  onPressed: () {
                                    controller.changePage(i);
                                  },
                                  color: controller.changeColor(i));
                       
                  })
                ],
              ),
            );
  }
}