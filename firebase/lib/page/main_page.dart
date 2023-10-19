import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class MainPage extends GetView<AuthController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/edit/profile'),
        child: const Icon(Icons.edit),
      ),
      body: Center(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(controller.user.value!.uid),
            Text(controller.profile.value?.bloodtype ?? "bloodtype"),
            Text(controller.profile.value?.job ?? "job"),
            Text(controller.profile.value?.mbti ?? "mbti"),
            Text('메인페이지'),
          ],
        ),
      )),
    );
  }
}
