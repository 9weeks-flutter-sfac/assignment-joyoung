import 'package:assignment/controller/bitcoin.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppSettingController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.model.appName),
            Text(controller.model.appAuthor),
            Text(controller.model.appVersion),
            Obx(
              () => Text('current coin : ${controller.count.value}'),
            ),
            Icon(
              FontAwesomeIcons.bitcoin,
              size: 96.0,
              color: Colors.yellow.shade700,
            ),
            TextButton(
                onPressed: () {
                  controller.count =0.obs;
                  print(controller.count.toString());
                },
                child: Text('코인 리셋'))
          ],
        ),
      ),
    );
  }
}
