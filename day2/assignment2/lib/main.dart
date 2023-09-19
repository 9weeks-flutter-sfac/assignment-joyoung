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
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '어땠나요?',
              style: TextStyle(fontSize: 30),
            ),
            Divider(),
            // SizedBox(child: Text('asd'),)
            SizedBox(
              height: 250,
              width: 290,
              child: PageView(
                children: [
                  Container(
                      width: 290,
                      height: 200,
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
            SizedBox(
              width: 300,
              height: 80,
              child: Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/100/100',
                        )),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('라이언'),
                        Text('라이언'),
                      ],
                    ),
                    Icon(Icons.add),
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
