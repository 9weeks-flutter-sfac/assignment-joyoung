// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:assignment/model/read.dart';
import 'package:assignment/util/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/secrets.dart';

class AuthorController extends GetxController {
  final Rxn<List<SecretModel>> _Author = Rxn();

  Dio dio = Dio();

  Future<List<SecretModel>> fetchAuthorData() async {
    final List<SecretModel> authorData = [];

    dio.options.baseUrl = "http://52.79.115.43:8090";
    try {
      var res = await dio.get(ApiRoutes.ScretAdress);
      if (res.statusCode == 200) {
        var data = res.data['items'];

        print(" data: " + data.toString());

        authorData.addAll(
          List<SecretModel>.from(data.map((e) => SecretModel.fromMap(e))),
        );
      }
    } catch (e) {
      print(e);
    }

    return authorData;
  }
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