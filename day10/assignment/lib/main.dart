import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

//image_picker: ^1.0.4

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var ImagePickers = ImagePicker();
  XFile? seletedImage;
  @override
  Widget build(BuildContext context) {
    if (seletedImage != null) {
      print(seletedImage?.path);
    } else {
      print(seletedImage?.path);
    }
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (seletedImage != null) Image.file(File(seletedImage!.path)),
            if (seletedImage == null) Text('이미지 없음'),
            TextButton(
                onPressed: () async {
                  var image =
                      await ImagePickers.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    print('이미지가 선택 되었습니다');
                    seletedImage = image;
                    print("이미지 경로 ${seletedImage?.path}");

                    setState(() {
                      seletedImage = image;
                    });
                  } else {
                    print('선택되지 않습니다');
                  }
                },
                child: Text('select Image'))
          ],
        ),
      )),
    );
  }
}

var ImagePickers = ImagePicker();
XFile? seletedImage;
// 갤러리에서 이미지 선택

