import 'package:assignment/model/searchmodel.dart';
import 'package:assignment/page/main_page.dart';
import 'package:assignment/utils/apiutil.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainPage(),
    );
  }
}
