import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('빌드');
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        appBar: AppBar(),
        body: DefaultTextStyle(
          style: TextStyle(fontSize: 20, color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Text('잉크웰'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Hello'),
                        content:
                            Text('This is a simple alert dialog with "Hello".'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              GestureDetector(
                child: Text('GestrueDetector'),
                onTap: () {
                  // showDialog(context: context, builder: builder)
                },
              ),
              OutlinedButton(onPressed: () {}, child: Text('outlined')),
              ElevatedButton(onPressed: () {}, child: Text('Elevated')),
              TextButton(onPressed: () {}, child: Text('Text 버튼')),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.abc_sharp),
              ),
              Icon(Icons.abc_sharp),
              TextField(
                cursorColor: Colors.red,
                onChanged: (value) {
                  print(value);
                  printhelow();
                },
                decoration: InputDecoration(
                  label: Text('이메일 입력'),
                  labelStyle: TextStyle(color: Colors.green),
                  hintText: 'expams@mg.gm',
                  fillColor: Colors.black12,
                  filled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void printhelow() {
  return print('hellow');
}

void example() {}

showResultDialog(BuildContext context, var result) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: 150,
          child: Center(
              child: Text(
            "$result",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
      );
    },
  );
}
