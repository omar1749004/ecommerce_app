import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/product_details_contrroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../link_api.dart';

class BackGrondProductDetails extends GetView<ProductDetailsControllerImp> {
  const BackGrondProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: ColorApp.KPrimaryColor,
                  ),
                ),
                Positioned(
                    top: 40,
                    right: Get.width / 8,
                    left: Get.width / 8,
                    child: Hero(
                        tag: controller.itemsModel.itemId,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${linkImageUpload}/${controller.itemsModel.itemImage}",
                          height: 250,
                          fit: BoxFit.fill,
                        )))
              ],
            );
  }
}