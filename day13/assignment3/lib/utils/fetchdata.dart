import 'package:assignment3/model/dogmodel.dart';
import 'package:dio/dio.dart';

Future<DogModel> fetchData(String url) async {
  final dio = Dio();

  try {
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      DogModel Dog = DogModel.fromMap(response.data);
      return Dog;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('An error occurred: $e');
  }
}
