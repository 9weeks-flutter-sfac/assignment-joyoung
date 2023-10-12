// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Slip2 {
  final int id;
  final String advice;
  Slip2({
    required this.id,
    required this.advice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'advice': advice,
    };
  }

  factory Slip2.fromMap(Map<String, dynamic> map) {
    return Slip2(
      id: map['id'] as int,
      advice: map['advice'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Slip2.fromJson(String source) =>
      Slip2.fromMap(json.decode(source) as Map<String, dynamic>);
}
