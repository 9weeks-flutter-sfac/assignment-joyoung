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
    getData();
  }


  Future<void> getData() async {
    try {
      Response response = await Dio().get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> dataMap = json.decode(response.data);
        var frommap = WiseSaying.fromMap(dataMap);
        data = frommap.slip;
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
      body: Center(
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
