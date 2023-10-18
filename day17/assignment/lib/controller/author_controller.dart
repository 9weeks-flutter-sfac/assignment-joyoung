// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:assignment/model/author_model.dart';
import 'package:assignment/util/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthorController extends GetxController {
  final Rxn<List<AuthorModel>> _Author = Rxn();

  Dio dio = Dio();

  Future<List<AuthorModel>> fetchAuthorData() async {
    final List<AuthorModel> authorData = [];

    dio.options.baseUrl = "http://52.79.115.43:8090";
    try {
      var res = await dio.get(ApiRoutes.UserListAdress);
      if (res.statusCode == 200) {
        var data = res.data['items'];

        print(" data: " + data.toString());

        authorData.addAll(
          List<AuthorModel>.from(data.map((e) => AuthorModel.fromMap(e))),
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