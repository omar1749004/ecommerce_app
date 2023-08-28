import 'package:e_commerce_app/data/models/orders_model.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController
{
  late OrdersModels ordersModels;
  
  @override
  void onInit() {
    ordersModels =Get.arguments["ordersModel"];
    super.onInit();
  }
}