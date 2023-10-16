// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:assignment2/model/wisesaying.dart';
import 'package:assignment2/utils/apiUtil.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Wise extends StatefulWidget {
  const Wise({super.key});

  @override
  State<Wise> createState() => _WiseState();
}

// 명언
  var data;

class _WiseState extends State<Wise> {
  var url = "https://api.adviceslip.com/advice";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(); // 여기서 초기에 이닛 해줄때 함수로 하니깐 이게 무슨 에러가 났음 정보를 받아오지 못한
  }


  Future<void> getData() async {  // 여기가 그냥 함수였음
    try {
      Response response = await Dio().get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> dataMap = json.decode(response.data);
        var frommap = WiseSaying.fromMap(dataMap); // 여기가 모델로 받아왔을듯 지금은 var
        data = frommap.slip; // 이렇게 받아옴
        setState(() {});
      }
    } catch (e) {
      print("에러: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('명언')),
      body: Center( // 원래는 여기가 퓨처빌드였는데 퓨처로 받아오면 이게 상관없음
        child: data == null
            ? null
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(data["id"].toString()),
                  Text(data["advice"].toString()),
                ],
              ),
      ),
    );
  }
}
