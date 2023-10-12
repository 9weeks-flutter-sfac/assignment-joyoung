
import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CatCommon2 {
  String fact;
  int length;
  CatCommon2({
    required this.fact,
    required this.length,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fact': fact,
      'length': length,
    };
  }

  factory CatCommon2.fromMap(Map<String, dynamic> map) {
    return CatCommon2(
      fact: map['fact'] as String,
      length: map['length'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CatCommon2.fromJson(String source) => CatCommon2.fromMap(json.decode(source) as Map<String, dynamic>);
}

// {
//     "fact": "Sir Isaac Newton is credited with creating the concept for the pet door that many cats use today to travel outdoors.",
//     "length": 116
// }