import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReadModel {
  String id;
  String collectionId;
  String collectionName;
  String created;
  String updated;
  String username;
  bool verified;
  bool emailVisibility;
  String email;
  String name;
  String avatar;
  ReadModel({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.username,
    required this.verified,
    required this.emailVisibility,
    required this.email,
    required this.name,
    required this.avatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'updated': updated,
      'username': username,
      'verified': verified,
      'emailVisibility': emailVisibility,
      'email': email,
      'name': name,
      'avatar': avatar,
    };
  }

  factory ReadModel.fromMap(Map<String, dynamic> map) {
    return ReadModel(
      id: map['id'] as String,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: map['created'] as String,
      updated: map['updated'] as String,
      username: map['username'] as String,
      verified: map['verified'] as bool,
      emailVisibility: map['emailVisibility'] as bool,
      email: map['email'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReadModel.fromJson(String source) =>
      ReadModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


// {
//   "page": 1,
//   "perPage": 30,
//   "totalPages": 1,
//   "totalItems": 2,
//   "items": [
//     {
//       "id": "**USER_RECORD_ID** (주말과제시 필요)",
//       "collectionId": "_pb_users_auth_",
//       "collectionName": "users",
//       "created": "2022-01-01 01:00:00Z",
//       "updated": "2022-01-01 23:59:59Z",
//       "username": "username123",
//       "verified": false,
//       "emailVisibility": true,
//       "email": "test@example.com",
//       "name": "test",
//       "avatar": "filename.jpg"
//     }
// 	]
// }