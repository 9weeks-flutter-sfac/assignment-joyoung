import 'package:assignment2/screens/activityPage.dart';
import 'package:assignment2/screens/cat.dart';
import 'package:assignment2/screens/cat2.dart';
import 'package:assignment2/screens/wise.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // SlipService().getSlip();
    return Scaffold(
      body: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 15, crossAxisSpacing: 15),
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cat(),
                      ));
                },
                child: Text('고양의 상식 1')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cat2(),
                      ));
                },
                child: Text('고양의 상식 2')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Wise(),
                      ));
                },
                child: Text('명언')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivityPage(),
                      ));
                },
                child: Text('액티비티')),
          ],
        ),
      ),
    );
  }
}
