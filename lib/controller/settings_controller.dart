import 'package:e_commerce_app/core/services/services.dart';

import 'package:firebase_messaging/firebase_messaging.dart';



import 'package:get/get.dart';

abstract class SettingsController extends GetxController
{
   logout();
}
class SettingsControllerImp extends SettingsController
{

  MyServices myServices =Get.find();
  @override
  logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic(
     "users${myServices.sharedPreferences.getString("id")}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed("/");
  }

}