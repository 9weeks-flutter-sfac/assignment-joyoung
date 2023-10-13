import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DogModel {
  String message;
  String status;
  DogModel({
    required this.message,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
    };
  }

  factory DogModel.fromMap(Map<String, dynamic> map) {
    return DogModel(
      message: map['message'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DogModel.fromJson(String source) =>
      DogModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
