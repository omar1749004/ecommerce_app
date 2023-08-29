import 'package:e_commerce_app/controller/notify_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static const String notificationId = "/notificationId";
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
        appBar: AppBar(
          title:  Text(
              "Notification",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        
        body: GetBuilder<NotificationController>(
          builder: (controller) => HandlingDataView(
            statusRequs: controller.statusRequs,
            widget: Container(
              padding: EdgeInsets.all(10),
              child: ListView(children: [
                const SizedBox(
                  height: 10,
                ),
                ...List.generate(
                    controller.data.length,
                    (index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Stack(children: [
                            ListTile(
                              title: Text(
                                  controller.data[index]["notification_title"]),
                              subtitle: Text(
                                  controller.data[index]["notification_body"]),
                            ),
                            Positioned(
                              right: 5,
                              top: 10,
                              child: Text(
                                Jiffy.parse(
                                        controller.data[index]
                                            ["notification_date"],
                                        pattern: 'yyyy-MM-dd HH:mm:ss')
                                    .fromNow(),
                                style: TextStyle(
                                    color: ColorApp.KPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ]),
                        ))
              ]),
            ),
          ),
        ));
  }
}
