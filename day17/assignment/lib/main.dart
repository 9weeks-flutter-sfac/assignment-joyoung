import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/author_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:assignment/controller/scret_controller.dart';
import 'package:assignment/controller/signup_controller.dart';
import 'package:assignment/controller/upload_controller.dart';
import 'package:assignment/pages/author_page.dart';
import 'package:assignment/pages/login_page.dart';
import 'package:assignment/pages/main_page.dart';
import 'package:assignment/pages/secret_page.dart';
import 'package:assignment/pages/signup_page.dart';
import 'package:assignment/pages/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'controller/login_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              'images/background/bamboocat.jpg',
            ),
            fit: BoxFit.cover,
          )),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '대나무에 서식하는 고양이를 \n 발견햇다',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    background: Paint()),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(30)),
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () => Get.toNamed(LoginPage.route),
                child: Text('이미 캣맘입니다(로그인)'),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed(SignUpPage.route),
                child: Text('캣맘클럽 가입하기(회원가입)'),
              ),
            ],
          )),
        ),
      ),
      theme: ThemeData(useMaterial3: true),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => SignUpController());
        Get.lazyPut(() => AuthController());
        Get.lazyPut(() => MainController());
        Get.lazyPut(() => ScretController());
        Get.lazyPut(() => UploadController());
        Get.lazyPut(() => AuthorController());
        // Get.put(dependency)
      }),
      getPages: [
        GetPage(
          name: LoginPage.route,
          page: () => LoginPage(),
        ),
        GetPage(
          name: SignUpPage.route,
          page: () => SignUpPage(),
        ),
        GetPage(
          name: MainPage.route,
          page: () => MainPage(),
        ),
        GetPage(
          name: SecretPage.route,
          page: () => SecretPage(),
        ),
        GetPage(
          name: UploadPage.route,
          page: () => UploadPage(),
        ),
        GetPage(
          name: AuthorPage.route,
          page: () => AuthorPage(),
        ),
      ],
    );
  }
}
