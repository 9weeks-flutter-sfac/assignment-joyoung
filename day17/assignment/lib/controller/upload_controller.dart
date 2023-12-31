// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/model/upload.dart';
import 'package:assignment/pages/main_page.dart';
import 'package:assignment/pages/secret_page.dart';
import 'package:assignment/util/api_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UploadController extends GetxController {
  final Rxn<List<UploadModel>> _upload = Rxn();

  var secretController = TextEditingController();
  var authorController = TextEditingController();
  var authorNameController = TextEditingController();
  var record = Get.find<AuthController>().login;

  Dio dio = Dio();

  Upload() async {
    dio.options.baseUrl = "http://52.79.115.43:8090";
    try {
      var res = await dio.post(ApiRoutes.ScretAdress, data: {
        'secret': secretController.text,
        'author': 'plkttjnr7q0mhi3',
        'authorName': 'plkttjnr7q0mhi3',
      });
      if (res.statusCode == 200) {
        var data = res.data;
        print(data);
        Get.to(SecretPage());
      }
    } catch (e) {
      print(e);
    }
  }
}


  // "id": "RECORD_ID",
  // "collectionId": "5647cebjvtwtcu1",
  // "collectionName": "secrets",
  // "created": "2022-01-01 01:00:00Z",
  // "updated": "2022-01-01 23:59:59Z",
  // "secret": "test",
  // "author": "RELATION_RECORD_ID",
	// "authorName":"test"