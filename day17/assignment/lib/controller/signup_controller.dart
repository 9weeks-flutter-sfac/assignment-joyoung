import 'package:assignment/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var emailController = TextEditingController();
  var pwController = TextEditingController();
  var nickController = TextEditingController();

  SignUp() {
    Get.find<AuthController>()
        .SignUp(emailController.text, pwController.text, nickController.text);
  }
}
