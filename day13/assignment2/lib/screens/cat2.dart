import 'package:assignment2/model/catcommon2.dart';
import 'package:flutter/material.dart';

class Cat2 extends StatefulWidget {
  const Cat2({super.key});

  @override
  State<Cat2> createState() => _Cat2State();
}

// 고양이 과제 2
//  https://catfact.ninja/fact

var url = "https://catfact.ninja/fact";
var data;

class _Cat2State extends State<Cat2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var response = await ApiUtil(url);
    if (response != null) {
      data = CatCommon2.fromMap(response.data);
      print("고양이 설명  ${data.data[0]}");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
