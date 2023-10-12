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


// {
//     "data": [
//         "Retractable claws are a physical phenomenon that sets cats apart from the rest of the animal kingdom. In the cat family, only cheetahs cannot retract their claws."
//     ]
// }