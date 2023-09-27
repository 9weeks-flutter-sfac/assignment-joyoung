import 'package:effort/Server.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      request();
                    },
                    child: Text('포스트 요청')),
                ElevatedButton(onPressed: () {}, child: Text('겟 요청')),
                ElevatedButton(onPressed: () {}, child: Text('포스트')),
              ]),
        ),
      ),
    );
  }
}
