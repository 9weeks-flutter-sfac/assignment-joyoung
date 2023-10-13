import 'package:assignment/model/model.dart';
import 'package:dio/dio.dart';

ApiUtil(url) async {
  final dio = Dio();
  final Response data = await dio.get('$url');
  if (data.statusCode == 200) {
    List<Model> model =
        List<Model>.from(data.data.map((e) => Model.fromMap(e)));
    return model;
  } else {
    return null;
  }
}
