import 'package:assignment2/model/wisesaying.dart';
import 'package:assignment2/utils/apiUtil.dart';
import 'package:flutter/material.dart';

class Wise extends StatefulWidget {
  const Wise({super.key});

  @override
  State<Wise> createState() => _WiseState();
}

var url = "https://meowfacts.herokuapp.com/";
var data;

class _WiseState extends State<Wise> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var response = await ApiUtil(url);
    if (response != null) {
      data = WiseSaying.fromMap(response.data);
      print("고양이 설명  ${data.data[0]}");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('고양이 상식 1')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: [Text('명언')]),
    );
  }
}
