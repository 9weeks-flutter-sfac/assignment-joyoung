import 'package:assignment/model/user.dart';
import 'package:assignment/uitil/api_routes.dart';
import 'package:assignment/view/login_page.dart';
import 'package:assignment/view/main_screen.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  User? get user => _user.value;

  final Rx<String> _token = Rx<String>("");
  String get token => _token.value;

  set token(String value) => _token.value = value;

  Dio dio = Dio();

  Login(String id, String pw) async {
    dio.options.baseUrl = "http://52.79.115.43:8090";
    try {
      var res = await dio.post(ApiRoutes.auth_with_password, data: {
        'identity': id,
        'password': pw,
      });
      if (res.statusCode == 200) {
        var token = res.data['token'];
        print(res.data.toString());
        var userdata = User.fromMap(res.data['record']);
        _user(userdata);
        _token(token);
      }
    } catch (e) {
      print(e);
    }
  }

  LogOut() {
    _user.value = null;
  }

  _handleAuthChanged(User? data) {
    if (data != null) {
      Get.toNamed(MainPage.route);
      return;
    }
    Get.offAndToNamed(LoginPage.route);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
