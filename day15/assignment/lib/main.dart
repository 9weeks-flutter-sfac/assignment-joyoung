import 'package:assignment/controller/appsettingcontroller.dart';
import 'package:assignment/model/model.dart';
import 'package:assignment/page2.dart';
import 'package:assignment/page3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppSettingController(
      model: Model(
          isSoundOn: true,
          isNotificationOn: true,
          appVersion: "1.0.0",
          appName: "비트코인",
          appAuthor: "조영",
          appPackageName: "비트코인 패키지",
          lastUpdated: DateTime.now()),
      count: RxInt(1),
    ));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text('Current coin  :${controller.count.value}'),
            ),
            TextButton(
                onPressed: () => Get.to(
                      const Page2(),
                    ),
                child: Text('상점으로 이동하기')),
                      TextButton(
                onPressed: () => Get.to(
                      const Page3(),
                    ),
                child: Text('만든이 정보로 이동하기'))
          ],
          
        ),
      ),
    );
  }
}
