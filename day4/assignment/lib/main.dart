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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        appBar: AppBar(),
        body: DefaultTextStyle(
          style: TextStyle(fontSize: 20, color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Text('잉크웰'),
                onTap: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       title: Text('Hello'),
                  //       content:
                  //           Text('This is a simple alert dialog with "Hello".'),
                  //       actions: [
                  //         TextButton(
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //           child: Text('OK'),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
                },
              ),
              InkWell(
                child: Text('잉크웰'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Hello'),
                        content:
                            Text('This is a simple alert dialog with "Hello".'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              GestureDetector(
                child: Text('GestrueDetector'),
                onTap: () {
                  // showResultDialog(context, "This is the result message");
                  print('asd');

                  // showDialog(context: context, builder: builder)
                },
              ),
              OutlinedButton(onPressed: () {}, child: Text('outlined')),
              ElevatedButton(onPressed: () {}, child: Text('Elevated')),
              TextButton(onPressed: () {}, child: Text('Text 버튼')),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.abc_sharp),
              ),
              Icon(Icons.abc_sharp),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onSubmitted: (value) {
                    print('onsubmit');
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    label: Text('이메일 입력'),
                    border: OutlineInputBorder(),
                    hintText: 'expams@gmail.com',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void printhelow() {
//   return print('hellow');
// }

// void example() {}
