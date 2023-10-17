import 'package:assignment/controller/login_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller.idController,
          ),
          TextField(
            controller: controller.pwController,
          ),
          ElevatedButton(
              onPressed: controller.login,
              child: Text('login'))
        ],
      )),
    );
  }
}
