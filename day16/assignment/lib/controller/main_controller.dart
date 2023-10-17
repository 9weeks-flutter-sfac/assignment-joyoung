import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/model/document.dart';
import 'package:assignment/uitil/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var pageController = PageController();
  RxInt curPage = 0.obs;
  final Rxn<List<Document>> _document = Rxn();
  List<Document>? get document => _document.value;

  onPageTapped(int v) {
    pageController.jumpToPage(v);
    curPage(v);
  }

  logout() {
    Get.find<AuthController>().LogOut();
  }

  Dio dio = Dio();

  readDocuments() async {
    var token = Get.find<AuthController>().token;
    dio.options.baseUrl = "http://52.79.115.43:8090";
    if (token != null) {
      var res = await dio.get(ApiRoutes.documents,
          options: Options(headers: {
            'Authorization': token,
          }));
      if (res.statusCode == 200) {
        print(res.data['items'].toString());

        List<Document> data =
            List.from(res.data['items'].map((e) => Document.fromMap(e)));
        _document(data);
        print(data);
        print("출력");
      }
    }
  }
}
