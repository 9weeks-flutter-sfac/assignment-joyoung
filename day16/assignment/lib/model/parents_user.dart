// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:assignment/model/user.dart';

class ParentsUser {
  User user;
  String token;
  ParentsUser({
    required this.user,
    required this.token,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'token': token,
    };
  }

  factory ParentsUser.fromMap(Map<String, dynamic> map) {
    return ParentsUser(
      user: User.fromMap(map['user'] as Map<String,dynamic>),
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentsUser.fromJson(String source) => ParentsUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
