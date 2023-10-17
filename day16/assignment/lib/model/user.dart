import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String id;

  String username;

  String email;
  String name;
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}


// {
//   "token": "JWT_TOKEN",
//   "record": {
//     "id": "RECORD_ID",
//     "collectionId": "_pb_users_auth_",
//     "collectionName": "users",
//     "created": "2022-01-01 01:00:00Z",
//     "updated": "2022-01-01 23:59:59Z",
//     "username": "username123",
//     "verified": false,
//     "emailVisibility": true,
//     "email": "test@example.com",
//     "name": "test",
//     "avatar": "filename.jpg"
//   }
// }