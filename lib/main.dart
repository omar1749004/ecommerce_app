import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/routs.dart';


import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/change_lacal.dart';
import 'core/localization/translition.dart';
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialService();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  LocalController controller=  Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      
      //routes:routs,
      getPages: routss,
      title: 'Flutter Demo',
      theme: controller.apptheme,
     
    );
  }
}

