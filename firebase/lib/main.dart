import 'package:firebase/controller/auth_controller.dart';
import 'package:firebase/controller/login_controller.dart';
import 'package:firebase/controller/profile_controller.dart';
import 'package:firebase/controller/profile_edit_controller.dart';
import 'package:firebase/firebase_options.dart';
import 'package:firebase/page/login_page.dart';
import 'package:firebase/page/main_page.dart';
import 'package:firebase/page/profile_edit_page.dart';
import 'package:firebase/page/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginContorller());
        Get.lazyPut(() => ProfileContorller());
        Get.lazyPut(() => ProfileEditController());
      }),
      getPages: [
        GetPage(
          name: '/',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/main',
          page: () => const MainPage(),
        ),
        GetPage(
          name: '/edit/profile',
          page: () => const ProfileEditPage(),
        ),
      ],
      initialRoute: '/',
    );
  }
}
