import 'dart:ui';

import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Text(
              '당신은 어쩌구 저쩌구 입니까?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () {},
              child: ListTile(
                leading: Icon(Icons.ac_unit_sharp),
                title: Text(' 답변목록'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
