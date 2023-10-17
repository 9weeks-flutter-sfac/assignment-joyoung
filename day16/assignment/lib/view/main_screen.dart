import 'package:assignment/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);
  static const String route = '/main';
  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user!;
    var token = Get.find<AuthController>().token;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.readDocuments();
        },
        child: Icon(Icons.refresh),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            onTap: controller.onPageTapped,
            currentIndex: controller.curPage.value,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "my"),
            ]),
      ),
      body: PageView(controller: controller.pageController, children: [
        Column(
          children: [
            Text(
              '${user!.name} 안녕하세요',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              token != null && token.isNotEmpty ? "토큰 :" + token : 'null',
              style: TextStyle(fontSize: 12),
            ),
            Obx(() => Expanded(
                  child: ListView.builder(
                    itemCount: controller.document?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(controller.document![index].title ?? ''),
                          Text(controller.document![index].content ?? ''),
                          Text(controller.document![index].sec_level ?? ''),
                          if (controller.document![index].attachment_url !=
                              null)
                            Image.network(controller
                                .document![index].attachment_url
                                .toString()),
                        ],
                      );
                    },
                  ),
                )),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(),
              title: Text(user.username),
              subtitle: Text(user.username),
            ),
            ListTile(
              title: Text('로그아웃 하기'),
              leading: Icon(Icons.logout),
              onTap: controller.logout,
            )
          ],
        ),
      ]),
    );
  }
}
