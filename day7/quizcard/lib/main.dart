import 'package:flutter/material.dart';
import 'package:quizcard/quizCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// 1. 주어진 데이터를 활용하여 퀴즈앱을 만듭니다.
// 2. 앱 배경색은 다음의 색상들을 Gradient로 표시합니다.
//     - Colors.pinkAccent
//     - Colors.blue
// 3. 퀴즈 위젯은 퀴즈 데이터 수 만큼 생성되며, 데이터에 퀴즈 데이터를 추가할 때 추가된 퀴즈도 위젯으로 되어 보여집니다.
// 4. 각 퀴즈의 보기들 중 하나를 클릭하였을 경우, 상단에 스코어가 위젯형태로 표시되며, 다음 페이지로 넘어갑니다.
//     - 정답시 Icon(Icons.circle_outlined) 가 추가됩니다.
//     - 오답시 Icon(Icons.close) 가 추가됩니다.
// 5. 모든 문제를 풀었을 경우, 하단에 FAB가 표시되며 이 때 표시되는 위젯은 Icon(Icons.refresh)가 됩니다.
//     - 해당 버튼을 클릭하면, 모든 스코어가 초기화되며 첫 퀴즈로 이동됩니다.
// 6. 제공되는 일부 코드가 있습니다.
// 7. 그 외 UI 디자인은 자유입니다.
//     - 폰트, 이미지의 사용, 글씨 크기 및 자간 등, 퀴즈 색상 자유

class _MyAppState extends State<MyApp> {
  List answer = ['', '', '', ''];

  @override
  Widget build(BuildContext context) {
    var pageCotroller = PageController();

    List<Map<String, dynamic>> quizs = [
      {
        "question": "의학적으로 얼굴과 머리를 구분하는 기준은 어디일까요?",
        "answer": 2,
        "options": ["코", "눈썹", "귀", "머리카락"]
      },
      {
        "question": "다음 중 바다가 아닌 곳은?",
        "answer": 3,
        "options": ["카리브해", "오호츠크해", "사해", "지중해"]
      },
      {
        "question": "심청이의 아버지 심봉사의 이름은?",
        "answer": 2,
        "options": ["심전도", "심학규", "심한길", "심은하"]
      },
      {
        "question": "심청전에서 심청이가 빠진 곳은 어디일까요?",
        "answer": 4,
        "options": ["정단수", "육각수", "해모수", "인당수"]
      },
      {
        "question": "택시 번호판의 바탕색은?",
        "answer": 3,
        "options": ["녹색", "흰색", "노란색", "파란색"]
      }
    ];
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.pinkAccent, Colors.blue])),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        pageCotroller.previousPage(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeIn);
                      },
                      icon: Icon(Icons.navigate_before,
                          color: Colors.white, size: 40),
                    ),
                    Text(
                      '${answer.join(' ')}',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        pageCotroller.nextPage(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeIn);
                      },
                      icon: Icon(Icons.navigate_next,
                          color: Colors.white, size: 40),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageCotroller,
                  itemCount: quizs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        QuizCard(
                          indexNumber: index,
                          quiz: quizs[index],
                          onCorrect: (e) {
                            print(e);
                            answer[e] = 'O';
                            setState(() {});
                          },
                          onIncorrect: (e) {
                            print(e);
                            answer[e] = 'X';
                            setState(() {});
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
