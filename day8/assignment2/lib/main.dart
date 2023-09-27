import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// 정답 5292304
class _MyAppState extends State<MyApp> {
  var data = '';

  Future<String> getData() async {
    print('겟 데이타 실행');

    var dio = Dio();
    var number = 133;
    var res = await dio.get(
        "https://sniperfactory.com/sfac/http_assignment_${number}",
        options: Options(
          headers: {
            'user-agent': 'SniperFactoryBroweser',
            'authorization': 'bearer ez-1234556'
          },
        ));
    return res.data['result'];
  }

  Future<dynamic> postData() async {
    print('포스트 데이타 실행 ');

    var dio = Dio();
    var number = 100;
    bool success = true;
    while (success) {
      try {
        var res = await dio.post(
            "https://sniperfactory.com/sfac/http_assignment_${number}",
            // "https://sniperfactory.com/sfac/http_test",

            options: Options(
              headers: {
                'user-agent': 'SniperFactoryBrowser',
                'authorization': 'bearer ez-1234'
              },
            ));

        if (res.statusCode == 200) {
          print('${number} 성공');
          success = false;
          return res.data['result'];
        } else {
          print('실패 숫자증가');
        }
      } catch (e) {
        print('예외 발생: $e');
        print('통신 실패, 다시 시도합니다. Number: $number');
        number += 1;
      }
      if (number > 150) {
        print('${number} 번 시도 후에도 실패');
        success = false;
      }
    }
  }

  void handleOnpressed() async {
    data = await postData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  handleOnpressed();
                },
                child: Text('텍스트 버튼')),
            Text(data),
          ],
        ),
      )),
    );
  }
}
