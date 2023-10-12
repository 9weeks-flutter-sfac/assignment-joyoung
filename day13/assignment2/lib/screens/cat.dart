import 'dart:convert';

import 'package:assignment2/model/catcommon.dart';
import 'package:assignment2/utils/apiUtil.dart';
import 'package:flutter/material.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

var url = "https://meowfacts.herokuapp.com/";
var data;

class _CatState extends State<Cat> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var response = await ApiUtil(url);
    if (response != null) {
      data = CatCommon.fromMap(response.data);
      print("고양이 설명  ${data.data[0]}");
      setState(() {});
    }
  }

// 고양이 상식 1 과제
// https://meowfacts.herokuapp.com/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('고양이 상식 1')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (data != null) Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('${data.data[0]}'),
            ),
          ]),
    );
  }
}
