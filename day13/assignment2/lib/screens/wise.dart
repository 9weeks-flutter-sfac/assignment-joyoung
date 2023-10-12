// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:assignment2/model/wisesaying.dart';
import 'package:assignment2/services/slip_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// 모르겠어
// class Slip2 {
//   Advice advice;
//   Slip2({
//     required this.advice,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'advice': advice.toMap(),
//     };
//   }

//   factory Slip2.fromMap(Map<String, dynamic> map) {
//     return Slip2(
//       advice: Advice.fromMap(map['advice'] as Map<String, dynamic>),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Slip2.fromJson(String source) =>
//       Slip2.fromMap(json.decode(source) as Map<String, dynamic>);
// }

class Wise extends StatefulWidget {
  const Wise({super.key});

  @override
  State<Wise> createState() => _WiseState();
}

var url = "https://api.adviceslip.com/advice";
WiseSaying? data;
var dio = Dio();
// 명언

class _WiseState extends State<Wise> {
  var test;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
    // getAdvice();
  }

  void getData() async {
    // var response = await ApiUtil(url);
    Response response = await dio.get(url);
    print("1 받은 데이타  ${response.data}");

    if (response.statusCode == 200) {
      print("2 받은 데이타  ${response.data}");

      var fuckdata = jsonDecode(response.data);
      print("json 데이타  ${fuckdata.runtimeType}");
      test = fuckdata;

      Map<String, dynamic> jsonTrans = fuckdata as Map<String, dynamic>;

      // // print("출력  ${fuckdata}");

      data = WiseSaying.fromMap(fuckdata['slip']);
      print("data  ${data}");

      setState(() {});
    }
  }

  getAdvice() async {
    Response response = await dio.get('https://api.adviceslip.com/advice');
    print(response.data);
    var paresResponse = jsonDecode(response.data);
    print(paresResponse.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    // if (data != null) {
    //   print(data!.toMap()); // print(data?.slip!['id']);

    //   print(data!.slip?['id']); // print(data?.slip!['id']);
    // } 널값인거 같애

    // 근데 내가 테스트로 그냥 데이타 통신 받은걸 찍어봤는데 그건 나오네??
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('명언')),
      body: FutureBuilder(
          future: SlipService().getSlip(),
          builder: ((context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return Text(snapshot.data!.advice);
              // return Text(snapshot.data);
            }
            return Center(child: CircularProgressIndicator());
          })),
      // body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      //   Text('명언'),
      //   if (data != null) Text(data!.slip.toString()),

      // ]),
    );
  }
}
