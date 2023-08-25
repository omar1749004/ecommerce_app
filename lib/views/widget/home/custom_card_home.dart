import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
//"A Summer Surprice"
//"Cashback 20%"
class CustomCardHome extends GetView<HomeContrllerImp> {
  const CustomCardHome({super.key, required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text(
                        title,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          body,
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                    height: 150,
                    decoration: BoxDecoration(
                        color: ColorApp.KPrimaryColor,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  Positioned(
                    top: -20,
                    right:controller.lang =="en" ? -20 : null,
                    left: controller.lang =="ar" ? -20 : null,
                    child: Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        color: ColorApp.secondColor,
                        borderRadius: BorderRadius.circular(160),
                      ),
                    ),
                  )
                ],
              ),
            );
  }
}
