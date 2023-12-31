import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthorModel {
  String collectionName;
  String avatar;
  String collectionId;
  String id;
  AuthorModel({
    required this.collectionName,
    required this.avatar,
    required this.collectionId,
    required this.id,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'collectionName': collectionName,
      'avatar': avatar,
      'collectionId': collectionId,
      'id': id,
    };
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      collectionName: map['collectionName'] as String,
      avatar: map['avatar'] as String,
      collectionId: map['collectionId'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) => AuthorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
