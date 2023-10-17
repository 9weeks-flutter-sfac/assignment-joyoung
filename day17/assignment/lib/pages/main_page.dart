import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:assignment/pages/author_page.dart';
import 'package:assignment/pages/login_page.dart';
import 'package:assignment/pages/secret_page.dart';
import 'package:assignment/pages/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background/bamboo.jpg'),
                fit: BoxFit.cover)),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white38,
                backgroundImage: AssetImage('images/avatar/woman.png')),
            SizedBox(
              height: 20,
            ),
            Text(
              '대나무숲의 캣맘',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white30),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.white70,
              child: ListTile(
                tileColor: Colors.blue,
                title: Text('대나무 숲',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text(
                  '놀러가기',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Get.toNamed(SecretPage.route),
                trailing: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('images/avatar/woman.png')),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.white70,
              child: ListTile(
                tileColor: Colors.blue,
                title: Text('대나무 숲에 발자국',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text(
                  '발자국을 추적하기 ',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Get.toNamed(AuthorPage.route),
                trailing: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('images/avatar/woman.png')),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.white70,
              child: ListTile(
                tileColor: Colors.blue,
                title: Text('대나무 숲에 외치러 가기',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text(
                  '외쳐보자',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Get.toNamed(UploadPage.route),
                trailing: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('images/avatar/woman.png')),
              ),
            )
          ],
        )),
      ),
    );
  }
}
