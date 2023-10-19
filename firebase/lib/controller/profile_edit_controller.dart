import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/controller/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class ProfileEditController {
  final RxnString mbti = RxnString();
  final RxnString job = RxnString();

  final RxnString bloodtype = RxnString();

  updateProfile() {
    String uid = Get.find<AuthController>().user.value!.uid;
    print(uid);

    FirebaseFirestore.instance.collection('profile').doc(uid).update({
      "mbti": mbti.value,
      "job": job.value,
      "bloodtype": bloodtype.value,
    });

    Get.find<AuthController>().fetchProfile(uid);
  }
}
