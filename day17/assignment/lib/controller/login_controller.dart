import 'package:assignment/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var idController = TextEditingController();
  var pwController = TextEditingController();

  login() {
    try {
      Get.find<AuthController>().Login(idController.text, pwController.text);
    } catch (e) {
        Get.defaultDialog(
        title: '로그인 실패',
        content: Text('아이디나 비밀번호가 틀렸습니다'),
        onCancel: () {
          return;
        },
      );
    }
  }
}
