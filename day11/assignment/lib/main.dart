import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          AnimatedOpacity(
            opacity: 1,
            duration: Duration(milliseconds: 3000),
            child: AspectRatio(
              aspectRatio: 4/3,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 3000),
                width: 300,
                height: 300,
                color: Colors.red,
                child: Text('123'),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
