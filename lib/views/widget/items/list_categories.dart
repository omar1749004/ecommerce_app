import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/Items_controller.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/models/categories_model.dart';

class ListCategoriesItem extends GetView<ItemsControllerImp> {
  const ListCategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:60,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal, //scroll horizantle
          itemBuilder: (context, index) {
            return Categories(
                categories: controller.categories[index], i: index);
          }),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  const Categories({required this.i, super.key, required this.categories});
  final CetegoriesModel categories;
  final int i;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.changeCat(i,categories.cId.toString());
      },
      child: Column(
        children: [
            GetBuilder<ItemsControllerImp>(builder: (contoller)=>Container(
              padding: EdgeInsets.only(bottom: 5 ,left:8, right:8 ),
              decoration:controller.selectCar ==i ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 3,color: ColorApp.KPrimaryColor))
              ):null,
              child: Text(
                "${translateDataBase(categories.cArName,categories.cName)}",
                style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              ),
            )),
          
        ]
      ),
    );
  }
}
