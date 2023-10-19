import 'package:firebase/controller/mian_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/auth_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/edit/profile'),
        child: const Icon(Icons.edit),
      ),
      body: Center(
          child: Obx(
        () => ListView(
         
            children: [
              Obx(
                () => Row(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundImage: controller.user!.photoURL != null
                          ? NetworkImage(controller.user!.photoURL!)
                          : null,
                    ),
                    Expanded(
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(controller.user!.uid),
                            Text(controller.profile?.bloodtype ?? "bloodtype"),
                            Text(controller.profile?.job ?? "job"),
                            Text(controller.profile?.mbti ?? "mbti"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ...controller.Images.map((e) {
                return Image.network(e);
              }).toList(),
              Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/sfac-flutter.appspot.com/o/images%2Fbamboocat.jpg?alt=media&token=84a76dfe-a5d7-4320-92d3-7ce22b4dd354'),
              TextButton(
                  onPressed: () async {
                    var picker = ImagePicker();
                    var res = await picker.pickImage(source: ImageSource.gallery);
                    if (res != null) {
                      controller.uploadIamge(res);
                    }
                  },
                  child: Text('upload')),
              TextButton(
                  onPressed: controller.fetchImages, child: Text('이미지 불러오기'))
            ],
          ),
        ),
      ),
    );
  }
}
