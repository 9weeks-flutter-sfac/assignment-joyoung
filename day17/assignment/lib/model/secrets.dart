import 'dart:convert';

import 'package:assignment/util/api_route.dart';
import 'package:dio/dio.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SecretModel {
  String created;
  String secret;
  String author;
  String authorName;
  String collectionId;
  SecretModel({
    required this.created,
    required this.secret,
    required this.author,
    required this.authorName,
    required this.collectionId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'created': created,
      'secret': secret,
      'author': author,
      'authorName': authorName,
      'collectionId': collectionId,
    };
  }

  factory SecretModel.fromMap(Map<String, dynamic> map) {
    return SecretModel(
      created: map['created'] as String,
      secret: map['secret'] as String,
      author: map['author'] as String,
      authorName: map['authorName'] as String,
      collectionId: map['collectionId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SecretModel.fromJson(String source) =>
      SecretModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

void main() {
  Dio dio = Dio();

  Secret() async {
    dio.options.baseUrl = "http://52.79.115.43:8090";
    try {
      var res = await dio.get(
        ApiRoutes.ScretAdress,
      );
      if (res.statusCode == 200) {
        var data = res.data['items'];

        List<SecretModel> userdata =
            List<SecretModel>.from(data.map((e) => SecretModel.fromMap(e)));

        print(userdata[0].secret);

        // _secret(userdata);
      }
    } catch (e) {
      print(e);
    }
  }

  Secret();
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