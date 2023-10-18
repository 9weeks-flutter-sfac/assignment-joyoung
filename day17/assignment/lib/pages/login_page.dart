import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/login_controller.dart';
import 'package:assignment/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const String route = '/login';
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/avatar/catmom.jpg"),
              fit: BoxFit.fitWidth),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '사료주러 로그인',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
            ),
            Input(
              label: '이메일',
              controller: controller.idController,
            ),
            SizedBox(
              height: 20,
            ),
            Input(
              label: '비밀번호',
              controller: controller.pwController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: controller.login, child: Text('login'))
          ],
        )),
      ),
    );
  }
}
