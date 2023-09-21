import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  List<String> food = ['asd', 'bsx'];
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

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            food.add('bbb');
            setState(() {});
          },
          child: Icon(Icons.chair_alt_outlined),
        ),
        body: Center(
            child: Column(
          children: [
            InkWell(
              child: Text('잉크웰'),
              onTap: () {
                showResultDialog(context, "asdasd");
              },
            ),
            Text('현재 레벨 $food 입니다'),
          ],
        )),
      ),
    );
  }
}
