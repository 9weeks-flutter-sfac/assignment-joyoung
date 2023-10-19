import 'package:firebase/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('아이디를 입력하세요'),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('패스워드를 입력하세요'),
                  ),
                ),
                SizedBox(
                  height: 16, 
                ),
                ElevatedButton(
                    onPressed: controller.providerGoogle, child: Text('로그인하기')),
                ElevatedButton(
                    onPressed: () {
                      controller.signup('id', 'pw');
                    },
                    child: Text('회원가입하기')),
                ElevatedButton(
                  onPressed: controller.signOut,
                  child: Text('로그아웃 하기'),
                ),
              ]),
        ),
      ),
    );
  }
}
