import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String st1 =
        '사랑을 다해 사랑을 하였노라고 \n정작 해야 할 말이 남아 있었음을 알았을 때 \n당신은 이미 남의 사람이 되어 있었다\n\n';
    String st2 =
        '불러야 할 뜨거운 노래를 가슴으로 죽이고 \n당신은 멀리 이루어지고 있었다\n\n하마 곱스런 눈 웃음이 사라지기 전\n두고두고 아름다움으로 잊어 달라지만 \n남자에게서 여자란 기쁨 아니면 슬픔\n\n다섯 손가락 끝을 잘라 핏물 오선을 그려\n혼자라도 외롭지 않을 밤에 울어보리라 \n\n';
    String st3 = '울어서 멍든 눈흘김으로\n미워서 미워지도록 사랑하리라 \n\n';
    String st4 =
        '한 잔은 떠나버린 너를 위하여 \n또 한 잔은 너와의 영원한 사랑을 위하여 \n그리고 또 한 잔은 이미 초라해진 나를 위하여 \n마지막 한 잔은 미리 알고 정하신 하나님을 위하여';

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: st1,
                    style: TextStyle(
                        color: Colors.grey[400], fontStyle: FontStyle.italic)),
                TextSpan(
                    text: st2,
                    style: TextStyle(
                        color: Colors.grey[500], fontStyle: FontStyle.italic)),
                TextSpan(
                    text: st3,
                    style: TextStyle(
                        color: Colors.grey[700], fontStyle: FontStyle.italic)),
                TextSpan(
                    text: st4,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
