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
      appBar: AppBar(title: Text('뒤로가기') ,elevation: 0),
      body: SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset("images/background/realcatmom.jpg" ,fit: BoxFit.fitWidth, height: 250,),
  
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            '캣맘클럽 회원가입',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
     
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
        ),
      ),
    );
  }
}
