import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String st1 =
        '이듬해 질 녘 꽃 피는 봄 한여름 밤의 꿈 \n가을 타 겨울 내릴 눈 일 년 네 번 또다시 봄\n정들었던 내 젊은 날 이제는 안녕\n아름답던 우리의 봄 여름 가을 겨울\n(Four seasons with no reason)\n\n';
    String st2 =
        '비 갠 뒤에 비애 대신 a happy end\n비스듬히 씩 비웃듯 칠색 무늬의 무지개\n철없이 철 지나 철들지 못해 (still)\n철부지에 철 그른지 오래\n\n';
    String st3 = 'Marchin\' 비발디, 차이코프스키\n오늘의 사계를 맞이해 (boy)\n마침내 마치 넷이 못내 \n\n';
    String st4 =
        '저 하늘만 바라보고서\n사계절 잘 지내고 있어, goodbye\n떠난 사람 또 나타난 사람\n머리 위 저세상, 난 떠나 영감의 amazon\n\n';
    String st5 =
        '지난 밤의 트라우마 다 묻고\n목숨 바쳐 달려올 새 출발 하는 왕복선\n변할래 전보다는 더욱더\n좋은 사람 더욱더, 더 나은 사람 더욱더\n\n';
    String st6 =
        '아침 이슬을 맞고 (내 안에)\n내 안에 분노 과거에 묻고\nFor life, do it away, away, away \n\n';

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: st1, style: TextStyle(color: Colors.lightBlue)),
                TextSpan(text: st2, style: TextStyle(color: Colors.red)),
                TextSpan(text: st3, style: TextStyle(color: Colors.green)),
                TextSpan(text: st4, style: TextStyle(color: Colors.grey)),
                TextSpan(text: st5, style: TextStyle(color: Colors.yellow)),
                TextSpan(text: st6, style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
