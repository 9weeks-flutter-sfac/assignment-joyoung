import 'package:assignment/model/login.dart';
import 'package:assignment/model/signup.dart';
import 'package:assignment/pages/login_page.dart';
import 'package:assignment/pages/signup_page.dart';
import 'package:assignment/util/api_route.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../pages/main_page.dart';

class AuthController extends GetxController {
  final Rxn<LoginModel> _login = Rxn();
  final Rxn<SignUpModel> _sign = Rxn();
  final Rx<String> _token = Rx<String>("");

  LoginModel? get login => _login.value;
  SignUpModel? get sign => _sign.value;
  String get token => _token.value;

  set token(String value) => _token.value = value;

  Dio dio = Dio();

  SignUp(String email, String pw, String username) async {
    dio.options.baseUrl = "http://52.79.115.43:8090";
    try {
      var res = await dio.post(ApiRoutes.SignUpdress, data: {
        'email': email,
        'password': pw,
        'passwordConfirm': pw,
        'username': username,
      });
      if (res.statusCode == 200) {
        print("res 데이타 출력" + res.data.toString());

        var userdata = SignUpModel.fromMap(res.data);
        print("userdata 데이타 출력" + userdata.toString());

        _sign.value = userdata;
        print(_sign.value!.emailVisibility);
      }
    } catch (e) {
      print("에러");

      print(e);
    }
  }

  Login(String id, String pw) async {
    dio.options.baseUrl = "http://52.79.115.43:8090";
    try {
      var res = await dio.post(ApiRoutes.LoginAdress, data: {
        'identity': id,
        'password': pw,
      });
      if (res.statusCode == 200) {
        print("res 데이타 출력" + res.data['record'].toString());
        LoginModel userdata = LoginModel.fromMap(res.data['record']);
        print("userdata" + userdata.toJson());
        _login.value = userdata;
        print(_login.toString());
      }
    } catch (e) {
      print("에러");
      print(e);
    }
  }

  LogOut() {
    _login.value = null;
  }

  _handleAuthChanged(LoginModel? data) {
    if (data != null) {
      print('데이타가 null이 아님');
      Get.toNamed(MainPage.route);
    } else {
      print('데이타가 null');
      Get.offAndToNamed(LoginPage.route);
    }
  }

  _handleSignSucess(SignUpModel? data) {
    if (data != null) {
      Get.toNamed(LoginPage.route);
      return;
    }
    Get.offAndToNamed(SignUpPage.route);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_login, _handleAuthChanged);
    ever(_sign, _handleSignSucess);
  }
}
