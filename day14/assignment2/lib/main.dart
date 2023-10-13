import 'package:assignment/model/model.dart';
import 'package:assignment/utils/apiutil.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Model? data;
String url = "https://jsonplaceholder.typicode.com/todos";

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    data = await ApiUtil(url);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {},
      )),
    );
  }
}
