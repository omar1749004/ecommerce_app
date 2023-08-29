
import 'package:e_commerce_app/core/functions/alert_exite_app.dart';
import 'package:e_commerce_app/views/screen/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screen_controller.dart';
import '../widget/home/custom_app bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: ((controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.toNamed(Cart.cartId); 
              },
              child: Icon(Icons.shopping_basket_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomAppBar(),
            body: WillPopScope(
              child:  controller.listPage.elementAt(controller.currentPage),
               onWillPop: alertExiteApp)
          )),
    );
  }
}
