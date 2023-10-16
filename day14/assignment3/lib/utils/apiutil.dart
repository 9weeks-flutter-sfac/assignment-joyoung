import 'package:assignment/model/searchmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

ApiUtil(url) async {
  final dio = Dio();
  try {
    final Response data = await dio.get('$url');
    if (data.statusCode == 200) {
      if (data.data != null) {
        var datalist = List<Map<String, dynamic>>.from(data.data);
        print(datalist.toString());

        List<SearchModel> model = datalist.map((e) {
          // 여기에서 Map을 SearchModel로 변환하고 인스턴스를 생성합니다.
          return SearchModel.fromMap(e);
        }).toList();
        print(model.toString());

        print('성공');
        return model;
      } else {
        print('1 실패');
        return null; // 빈 리스트 반환
      }
    }
  } catch (e) {
    print('2 실패');

    return null; // 빈 리스트 반환
  }
}
