 import 'package:e_commerce_app/core/shared/custom_bottom.dart';
import 'package:e_commerce_app/core/shared/payment_method_listview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

Future<bool>paymentBotoomSheet(void Function()? ontap , ){
  Get.bottomSheet(
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    const  SizedBox(
                        height: 16,
                      ),
                     const PaymentMethodsListView(),
                     const SizedBox(
                        height: 32,
                      ),
                      CustomBottom(ontap: ontap, text: "Continue")
                    ],
                  ),
                ),
              ),
            );
              return Future.value(true);
}