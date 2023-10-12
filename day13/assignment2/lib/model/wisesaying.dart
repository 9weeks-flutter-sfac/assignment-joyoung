import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WiseSaying {
  Map<String, dynamic>? slip;
  WiseSaying({
    required this.slip,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'slip': slip,
    };
  }

  factory WiseSaying.fromMap(Map<String, dynamic> map) {
    // final Map<String, dynamic> slipData = map['slip'] ;
    return WiseSaying(
      slip: map['slip'] != null ? map['slip'] as Map<String, dynamic> : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WiseSaying.fromJson(String source) =>
      WiseSaying.fromMap(json.decode(source) as Map<String, dynamic>);
}


// {
//     "slip": {
//         "id": 206,
//         "advice": "Don't waste food."
//     }
// }