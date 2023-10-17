import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/scret_controller.dart';

class SecretPage extends GetView<ScretController> {
  const SecretPage({super.key});
  static const String route = '/secret';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('뒤로가기'),
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background/bamboo2.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken))),
          child: Obx(
            () => PageView.builder(
              itemCount: controller.scret!.length == null
                  ? 0
                  : controller.scret!.length,
              itemBuilder: (context, index) {
                return ZoomIn(
                  duration: Duration(milliseconds: 2000),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                          height: 45,
                          image: AssetImage('images/avatar/girl.png')),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          controller.scret![0].created,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      Text(
                        "이름" ?? "익명",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }
}
