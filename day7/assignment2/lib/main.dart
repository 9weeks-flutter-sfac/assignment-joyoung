import 'package:animate_do/animate_do.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

// 애니메이션  english word
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: PageView.builder(
          itemCount: nouns.length,
          itemBuilder: (context, index) {
            return ZoomIn(
              duration: Duration(milliseconds: 1500),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Badge(
                      label: Text('a'),
                      child: Text(nouns[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "This is Center Short Toast",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      child: Text('버튼'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
