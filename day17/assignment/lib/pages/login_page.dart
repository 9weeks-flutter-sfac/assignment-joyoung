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
        child: Center(
            child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/avatar/catmom.jpg"),
              Text(
                '사료주러 로그인',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
          ),
        )),
      ),
    );
  }
}
