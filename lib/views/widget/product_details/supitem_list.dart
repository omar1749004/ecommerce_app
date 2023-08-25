import 'package:e_commerce_app/controller/product_details_contrroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSupItem extends GetView<ProductDetailsControllerImp> {
  const CustomSupItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                    children: [
                      ...List.generate(controller.supItems.length,
                       (index) =>  Container(
                        margin: EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        width: 90,
                        height: 60,
                        decoration: BoxDecoration(
                          color: controller.supItems[index]["active"]== 1 ? Color.fromARGB(255, 2, 44, 129):Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromARGB(255, 2, 44, 129))),
                        child: Text(
                          controller.supItems[index]["name"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: controller.supItems[index]["active"]== 0 ? Color.fromARGB(255, 2, 44, 129):Colors.white),
                        ),
                      ),)
                     
                     
                    ],
                  );
  }
}