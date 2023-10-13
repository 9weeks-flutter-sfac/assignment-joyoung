import 'package:assignment/controller/bitcoin.dart';
import 'package:assignment/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppSettingController>();

    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.back(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(controller.model.appAuthor),
              Text(controller.model.appName),
              Text(controller.model.appPackageName),
              Text(controller.model.appVersion),
              Text(controller.model.isNotificationOn
                  ? "notification : true"
                  : "notification : false"),
              Text(controller.model.lastUpdated != null
                  ? "${controller.model.lastUpdated}"
                  : '정보 없음'),
            ],
          ),
        ),
      ),
    );
  }
}
