import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dio = Dio();
  var resValue;
  void getDataUsingDio() async {
    var res = await dio.get('https://sniperfactory.com/sfac/http_only_jwt_included',
        options: Options(headers: {
          'user-agent': 'Chrome',
          // 'authorization' : 'Bearer ez-123123123123'
        })
        );
    resValue = res;
    print("response :" + res.toString());
    // options: Options(headers: {'user-agent :Chrome,'}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  getDataUsingDio();
                },
                child: Text('클릭'),
              ),
              Text(resValue.toString()),
            ],
          ),
        ),
      )),
    );
  }
}
