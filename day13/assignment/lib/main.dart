import 'package:assignment/model/mbti.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<MbtiModel>? mbti;

Map<int, MbtiModel> member = {
  0: MbtiModel(
    nickname: "원형탈모",
    name: "정원형",
    mbti: MBTI.ENTJ,
    solo: false,
    favoriteFood: ['라면 , 떡볶이'],
  ),
  1: MbtiModel(
    nickname: "오마뗑",
    name: "오정현",
    mbti: MBTI.isfp,
    solo: false,
    favoriteFood: ['라면 , 떡볶이'],
  ),
  2: MbtiModel(
    nickname: "빡빡이",
    name: "조영",
    mbti: MBTI.INFJ,
    solo: false,
    favoriteFood: ['라면 , 떡볶이'],
  ),
};

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: PageView.builder(
        itemCount: member.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${member[index]!.name}'),
              Text('${member[index]!.nickname}'),
              Text('${member[index]!.mbti}'),
              Text('${member[index]!.solo}'),
              Text('${member[index]!.favoriteFood}'),
            ],
          );
        },
      )),
    );
  }
}
