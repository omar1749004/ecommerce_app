import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/home_controller.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/models/categories_model.dart';
import '../../../link_api.dart';

class ListCategories extends GetView<HomeContrllerImp> {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: 110,
             child: ListView.separated(
              separatorBuilder:  (context , index) =>const SizedBox(width: 10,),
              itemCount: controller.categories.length,
              scrollDirection: Axis.horizontal, //scroll horizantle
              itemBuilder: (context , index){
                return Categories(categories: controller.categories[index],i:index );
              }),
            );
  }
}

class Categories extends GetView<HomeContrllerImp> {
  const Categories( {required this.i,super.key, required this.categories});
  final CetegoriesModel categories;
  final int i ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      controller.gotoItems(i,categories.cId.toString());
      },
      child: Column(
                    children: [
                      Container(
                    decoration: BoxDecoration(
                     color: const Color.fromARGB(255, 161, 131, 235)
                    ),
                    height: 70,
                    width: 70,
                    child:
                     Image.network(
                      
                      "$linkImageUpload/${categories.cImageNmae}",
                          width: 40,
                          height: 10,
                          fit: BoxFit.fill
                      ,),
                      
                  ),Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text("${translateDataBase(categories.cArName,categories.cName)}"
                    
                    ,),
                  )
                    ],
                  ),
    );
  }
}