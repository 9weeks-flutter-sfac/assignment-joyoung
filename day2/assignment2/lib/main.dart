import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              '오늘의 하루는',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              '어땠나요?',
              style: TextStyle(fontSize: 20),
            ),
            // SizedBox(child: Text('asd'),)
            SizedBox(
              height: 250,
              width: 290,
              child: PageView(
                children: [
                  Container(
                      width: 290,
                      height: 200,
                      child: Center(
                          child: Text(
                        '우울함',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, // 텍스트 색상을 검정색으로 설정
                          fontSize: 24, // 텍스트 크기를 조정 (원하는 크기로 변경하세요)
                        ),
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.black, Colors.white]),
                      )),
                  Container(
                      width: 290,
                      height: 200,
                      child: Center(
                          child: Text(
                        '행복함',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, // 텍스트 색상을 검정색으로 설정
                          fontSize: 24, // 텍스트 크기를 조정 (원하는 크기로 변경하세요)
                        ),
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.orange,
                              const Color.fromARGB(255, 233, 216, 60)
                            ]),
                      )),
                  Container(
                      width: 290,
                      height: 200,
                      child: Center(
                          child: Text(
                        '상쾌함',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, // 텍스트 색상을 검정색으로 설정
                          fontSize: 24, // 텍스트 크기를 조정 (원하는 크기로 변경하세요)
                        ),
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.blue, Colors.green]),
                      )),
                ],
              ),
            ),
            Divider(height: 30),

            SizedBox(
              height: 80,
              child: Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/100/100',
                          )),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '라이언',
                          style: TextStyle(
                            color: Colors.white, // 텍스트 색상을 하얀색으로 설정
                          ),
                        ),
                        Text(
                          '라이언은 바쁩니다',
                          style: TextStyle(
                            color: Colors.white, // 텍스트 색상을 하얀색으로 설정
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                    // Text(Icon(Icons.add_alarm))
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
