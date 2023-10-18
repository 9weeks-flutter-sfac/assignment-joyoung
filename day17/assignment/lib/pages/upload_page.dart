import 'package:assignment/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/input_field.dart';

class UploadPage extends GetView<UploadController> {
  const UploadPage({super.key});
  static const String route = '/upload';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),

          backgroundColor: Colors.transparent,
          title: Text('뒤로가기' ,style: TextStyle(color: Colors.white)),
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
                      ColorFilter.mode(Colors.black26, BlendMode.color))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
        
                  TextField(
                    controller: controller.secretController,
                    minLines: 7,
                    maxLines: 8,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.white70),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.lightGreen)),
                      onPressed: controller.Upload,
                      child: Text(
                        '대나무 숲에 외치기!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ))
                ]),
          ),
        ));
  }
}
