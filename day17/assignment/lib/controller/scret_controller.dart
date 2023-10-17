import 'package:assignment/model/secrets.dart';
import 'package:assignment/util/api_route.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class ScretController extends GetxController {
  final Rxn<List<SecretModel>> _scret = Rxn();

  List<SecretModel>? get scret => _scret.value;

  Dio dio = Dio();

  Secret() async {
    dio.options.baseUrl = "http://52.79.115.43:8090";
    try {
      var res = await dio.get(
        ApiRoutes.ScretAdress,
      );
      if (res.statusCode == 200) {
        print(res.data.toString());
        var data = res.data['itmes'];
        List<SecretModel> userdata =
            List.from(data.map((e) => SecretModel.fromMap(e)));
        _scret(userdata);
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
    ever(_scret, (value) {
      print(_scret);
    });
  }
}
