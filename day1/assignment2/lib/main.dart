import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String st1 = '소개';
    String st2 = 'INFJ';
    String st3 = '개발자';
    String st4 = '꿈';

    List li = [
      '안녕하세요!\n',
      '간단하게 제 ',
      '를 해보겠습니다\n\n',
      '먼저 저의 MBTI는 ',
      '이고\n',
      '직업은 ',
      '입니다\n\n',
      ' 은 없고요\n',
      '그냥 놀고싶습니다\n\n',
      '감사합니다'
    ];

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: li[0],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: li[1],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: st1,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                TextSpan(
                  text: li[2],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: li[3],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: st2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 20)),
                TextSpan(
                  text: li[4],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: li[5],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: st3,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 20)),
                TextSpan(
                  text: li[6],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: st4,
                    style: TextStyle(
                     
                        color: Colors.amber,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.black)),
                TextSpan(
                  text: li[7] + li[8],
                  style: TextStyle(
                 
                      decoration: TextDecoration.lineThrough),
                ),
                TextSpan(
                  text: li[9],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
