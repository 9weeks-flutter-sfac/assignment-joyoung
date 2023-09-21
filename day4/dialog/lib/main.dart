import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  int x = 0;
  int y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('사칙연산')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('x의 값은?'),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        // FilteringTextInputFormatter.allow('[0-9]'),
                        LengthLimitingTextInputFormatter(8),
                      ],
                      onChanged: (value) {
                        x = int.parse(value);
                      },
                      decoration: InputDecoration(
                        // label: Text('이메일 입력'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'x값을 입력하세요.',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('y의 값은?'),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        // FilteringTextInputFormatter.allow('[0-9]'),
                        LengthLimitingTextInputFormatter(8),
                      ],
                      onChanged: (value) {
                        y = int.parse(value);
                      },
                      decoration: InputDecoration(
                        // label: Text('이메일 입력'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'y값을 입력하세요.',
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  showResultDialog(context, x + y);
                },
                child: Text('더하기의 결과값은?')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showResultDialog(context, x * y);
                },
                child: Text('곱하기의 결과값은?')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showResultDialog(context, x - y);
                },
                child: Text('빼기의 결과값은?')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showResultDialog(context, x / y);
                },
                child: Text('나누기의 결과값은?')),
          ],
        ),
      ),
    );
  }
}

showResultDialog(BuildContext context, var result) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
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
