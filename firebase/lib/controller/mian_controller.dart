import 'dart:io';

import 'package:firebase/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/profile.dart';

class MainController extends GetxController {
  final RxList Images = [].obs;

  User? get user => Get.find<AuthController>().user.value;
  Profile? get profile => Get.find<AuthController>().profile.value;

  fetchImages() async {
    var ref = FirebaseStorage.instance.ref('/images');
    var res = await ref.listAll();
    Images.clear();
    print(res);
    for (var item in res.items) {
      var url = await item.getDownloadURL();
      Images.add(url);
      print(url);
    }
  }

  uploadIamge(XFile file) {
    print('업로드');
    var ref = FirebaseStorage.instance.ref('/images/${file.name}');
    ref.putFile(File(file.path)).then((p0) => fetchImages());
    // fetchImages();
  }
}
