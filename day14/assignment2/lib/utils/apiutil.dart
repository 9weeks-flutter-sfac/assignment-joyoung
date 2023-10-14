import 'package:assignment/model/model.dart';
import 'package:dio/dio.dart';

ApiUtil(url) async {
  final dio = Dio();
  final Response data = await dio.get('$url');
  if (data.statusCode == 200) {
    print(data.data.runtimeType);

    List<Profile> serialData =
        List<Profile>.from(data.data.map((e) => Profile.fromMap(e)));
    print(serialData.runtimeType);
    return serialData;
  } else {
    return null;
  }
}
