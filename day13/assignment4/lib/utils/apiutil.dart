import 'package:assignment/model/model.dart';
import 'package:dio/dio.dart';

Future<List<Model>> fetchData(String url) async {
  final dio = Dio();

  try {
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      List<Model> Dog =
          List<Model>.from(response.data.map((e) => Model.fromMap(e)));
      return Dog;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('An error occurred: $e');
  }
}
