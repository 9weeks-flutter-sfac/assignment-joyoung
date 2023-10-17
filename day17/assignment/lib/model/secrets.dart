import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SecretModel {
  String created;
  String secret;
  String author;
  String authorName;
  SecretModel({
    required this.created,
    required this.secret,
    required this.author,
    required this.authorName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'created': created,
      'secret': secret,
      'author': author,
      'authorName': authorName,
    };
  }

  factory SecretModel.fromMap(Map<String, dynamic> map) {
    return SecretModel(
      created: map['created'] as String,
      secret: map['secret'] as String,
      author: map['author'] as String,
      authorName: map['authorName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SecretModel.fromJson(String source) =>
      SecretModel.fromMap(json.decode(source) as Map<String, dynamic>);
}


// {
//   "page": 1,
//   "perPage": 30,
//   "totalPages": 1,
//   "totalItems": 2,
//   "items": [
//     {
//       "id": "RECORD_ID",
//       "collectionId": "5647cebjvtwtcu1",
//       "collectionName": "secrets",
//       "created": "2022-01-01 01:00:00Z",
//       "updated": "2022-01-01 23:59:59Z",
//       "secret": "test",
//       "author": "RELATION_RECORD_ID",
// 			"authorName": "test",
//     }
//   ]
// }