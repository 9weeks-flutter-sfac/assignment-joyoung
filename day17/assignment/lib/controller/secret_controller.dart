import 'dart:js_interop';

import 'package:assignment/model/secrets.dart';
import 'package:assignment/util/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SecretController extends GetxController {
  final Rxn<List<SecretModel>> _secret = Rxn();

  List<SecretModel>? get secret => _secret.value;

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

        // print(userdata[1].secret);

        _secret(userdata);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Secret();
    ever(_secret, (value) {
      print(secret![0].secret);
    });
  }
}
