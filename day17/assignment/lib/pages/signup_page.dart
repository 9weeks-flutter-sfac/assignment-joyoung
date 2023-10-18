import 'package:assignment/controller/signup_controller.dart';
import 'package:assignment/widget/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});
  static const String route = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Input(
            label: '이메일',
            controller: controller.emailController,
          ),
          SizedBox(
            height: 10,
          ),
          Input(
            label: '비밀번호',
            controller: controller.pwController,
          ),
          SizedBox(
            height: 10,
          ),
          Input(
            label: '닉네임',
            controller: controller.nickController,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: controller.SignUp, child: Text('회원 가입'))
        ],
      )),
    );
  }
}