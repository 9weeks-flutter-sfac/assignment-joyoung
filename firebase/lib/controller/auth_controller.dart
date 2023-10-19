import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/model/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final Rxn<User> user = Rxn<User>();
  final Rxn<Profile> profile = Rxn<Profile>();

  fetchProfile(String uid) async {
    var res =
        await FirebaseFirestore.instance.collection('profile').doc(uid).get();
    if (res.exists) {
      var data = res.data()!;
      print('통신성공1');

      profile(Profile(
        mbti: data['mbti'],
        job: data['job'],
        bloodtype: data['bloodtype'],
      ));
      print('통신성공2');
      print(profile);

    } else {
      print('통신에러');
      // Handle the case when the document doesn't exist.
    }
  }

  @override
  onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((value) {
      user(value);
      if (value != null) {
        print('value에 값이들어옴${value.uid}');
        fetchProfile(value.uid);
        Get.toNamed('/main');
      } else {
        print('value에 값이 없음');

        Get.toNamed('/');
      }
    });
  }

  login(id, pw) =>
      FirebaseAuth.instance.signInWithEmailAndPassword(email: id, password: pw);

  signup(id, pw) => FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: id, password: pw);

  signOut() => {print('로그아웃'), FirebaseAuth.instance.signOut()};

  providerGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn(); // 이게 문제고만

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
