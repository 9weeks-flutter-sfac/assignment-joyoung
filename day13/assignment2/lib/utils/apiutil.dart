import 'package:dio/dio.dart';

ApiUtil(url) async {
  final dio = Dio();
  final Response data = await dio.get('$url');
  if (data.statusCode == 200) {
    return data;
  } else {
    return null;
  }
}
