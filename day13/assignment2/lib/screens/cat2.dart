import 'package:assignment2/model/catcommon2.dart';
import 'package:assignment2/utils/apiUtil.dart';
import 'package:flutter/material.dart';

class Cat2 extends StatefulWidget {
  const Cat2({super.key});

  @override
  State<Cat2> createState() => _Cat2State();
}

// 고양이 과제 2
//  https://catfact.ninja/fact

var url = "https://catfact.ninja/fact";
CatCommon2? data;

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
      print("고양이 설명  ${data}");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('고양이 상식 2')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (data != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("${data!.length}" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(data!.fact),
                  ],
                ),
              ),
          ]),
    );
  }
}
