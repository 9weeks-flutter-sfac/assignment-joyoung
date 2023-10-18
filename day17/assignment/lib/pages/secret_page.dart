import 'package:animate_do/animate_do.dart';
import 'package:assignment/model/secrets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/scret_controller.dart';

class SecretPage extends GetView<SecretController> {
  const SecretPage({super.key});
  static const String route = '/secret';

  @override
  Widget build(BuildContext context) {
    // Obx(() => Text(secretList![0].secret));

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('뒤로가기'),
          centerTitle: false,
          elevation: 0,
        ),
        body: Obx(() {
          final secretList =
              controller.secret; // 또는 Get.find<SecretController>().secret;

          if (secretList == null) {
            // 데이터가 아직 로드되지 않았거나 null인 경우에 대한 처리
            return CircularProgressIndicator(); // 또는 다른 로딩 상태 표시
          } else {
            return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background/bamboo2.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black54, BlendMode.darken))),
                child: PageView.builder(
                  itemCount: secretList.length,
                  itemBuilder: (context, index) {
                    final secret = secretList[index];
                    return ZoomIn(
                      duration: Duration(milliseconds: 2000),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            height: 45,
                            image: AssetImage('images/avatar/girl.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0), /////
                            child: Text(
                              secret.secret ??
                                  secret.secret, // 비밀 정보의 텍스트를 가져와 표시
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                          Text(
                            secret.authorName ?? secret.authorName,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  },
                ));
          }
        }));
  }
}
