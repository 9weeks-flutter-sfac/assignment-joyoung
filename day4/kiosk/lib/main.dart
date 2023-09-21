import 'package:flutter/material.dart';
import 'package:kiosk/menu.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  List<String> food = [];
  @override
  Widget build(BuildContext context) {
    showResultDialog(BuildContext context, var result) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 150,
              child: Center(
                  child: Text(
                "$result",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('분식왕 이테디 주문하기')),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: () {
          food = [];
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '초기화 하기',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '주문리스트',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text('$food '),
            Text(
              '음식',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 18,
              children: [
                Menu(
                  name: '맥주',
                  img: 'images/option_beer.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '떡볶이',
                  img: 'images/option_bokki.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '김밥',
                  img: 'images/option_kimbap.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '오무라이스',
                  img: 'images/option_kimbap.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '돈까스',
                  img: 'images/option_pork_cutlets.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '라면',
                  img: 'images/option_ramen.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '우동',
                  img: 'images/option_udon.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
