import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.quiz,
    required this.onCorrect,
    required this.onIncorrect,
    required this.indexNumber,
  });
  final Map<String, dynamic> quiz;
  final Function onCorrect;
  final Function onIncorrect;
  final int indexNumber;
  @override
  Widget build(BuildContext context) {
    var fn = () {};
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 500,
        width: 350,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '${indexNumber + 1}. ${quiz['question']}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(200, 40)),
            ),
            child: Text(' ${quiz['options'][0]}'),
            onPressed: () {
              if (1 == quiz['answer']) {
                return onCorrect(indexNumber);
              } else {
                return onIncorrect(indexNumber);
              }
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(200, 40)),
            ),
            child: Text(quiz['options'][1]),
            onPressed: () {
              if (2 == quiz['answer']) {
                return onCorrect(indexNumber);
              } else {
                return onIncorrect(indexNumber);
              }
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(200, 40)),
            ),
            child: Text(quiz['options'][2]),
            onPressed: () {
               if (3 == quiz['answer']) {
                return onCorrect(indexNumber);
              } else {
                return onIncorrect(indexNumber);
              }
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(200, 40)),
            ),
            child: Text(quiz['options'][3]),
            onPressed: () {
               if (4 == quiz['answer']) {
                return onCorrect(indexNumber);
              } else {
                return onIncorrect(indexNumber);
              }
            },
          ),
          SizedBox(height: 10),
        ]),
      ),
    );
  }
}
