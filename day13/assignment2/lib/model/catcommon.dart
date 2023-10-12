// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatCommon {
  final List<String> data;
  CatCommon({
    required this.data,
  });

  factory CatCommon.fromMap(Map<String, dynamic> map) {
    var data = List<String>.from(map['data']);
    return CatCommon(data: data);
  }
}
