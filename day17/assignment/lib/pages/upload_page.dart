import 'package:assignment/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPage extends GetView<UploadController> {
  const UploadPage({super.key});
  static const String route = '/upload';

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('뒤로가기'),
          centerTitle: false,
          elevation: 0,
        ),
        // body:
        //  Container(
        //   alignment: Alignment.center,
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage('assets/images/background/bamboo2.jpg'),
        //           fit: BoxFit.cover,
        //           colorFilter:
        //               ColorFilter.mode(Colors.black26, BlendMode.color))),
        //   child: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.stretch,
        //         children: [
        //           TextField(
        //             controller: controller,
        //             minLines: 7,
        //             maxLines: 8,
        //             decoration: InputDecoration(
        //                 filled: true, fillColor: Colors.white70),
        //           ),
        //           ElevatedButton(
        //               style: ButtonStyle(
        //                   backgroundColor:
        //                       MaterialStatePropertyAll(Colors.lightGreen)),
        //               onPressed: () async {
        //                 if (controller.text != '') {
        //                   var secret =
        //                       await SecretCatApi.addSecret(controller.text);
        //                   if (secret != null) {
        //                     Navigator.pop(context);

        //                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //                         content: Text(
        //                             '대나무숲 외쳤습니다!! 메세지 :  ${secret.secret}')));
        //                   }
        //                 }
        //               },
        //               child: Text(
        //                 '대나무 숲에 외치기!',
        //                 style: TextStyle(
        //                     fontWeight: FontWeight.bold, fontSize: 20),
        //               ))
        //         ]),
        //   ),
        // )
        );
  }
}
