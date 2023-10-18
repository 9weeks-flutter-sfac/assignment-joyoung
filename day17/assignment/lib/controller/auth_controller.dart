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
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (emailRegExp.hasMatch(email) == false) {
      print('이메일 양식이 안맞음');
      return;
    }
    if (pw.length <= 8) {
      print('비밀번호 9자 미만');
      return;
    }
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
        SignUpModel userdata = SignUpModel.fromMap(res.data);
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
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (emailRegExp.hasMatch(id) == false) {
      print('이메일 양식이 안맞음');
      return;
    }
    if (pw.length <= 8) {
      print('비밀번호 9자 미만');
      return;
    }
    dio.options.baseUrl = "http://52.79.115.43:8090";
    try {
      var res = await dio.post(ApiRoutes.LoginAdress, data: {
        'identity': id,
        'password': pw,
      });
      if (res.statusCode == 200) {
        LoginModel userdata = LoginModel.fromMap(res.data['record']);

        _login.value = userdata;
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
