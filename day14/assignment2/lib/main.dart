import 'package:assignment/profilePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// https://xsgames.co/randomusers/assets/avatars/male/{번호}.jpg
// 프로필 앱 만들기
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProfilePage());
  }
}
