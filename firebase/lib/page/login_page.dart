import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        print('회원가입이 됬거나 유저가 들어왔다');
        print(FirebaseAuth.instance.currentUser);
        return;
      }
      print('회원가입이나 로그인이 필요하다');
    });
  }

  _handleLoginButton() async {
    var res = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: 'test@gmail.com',
      password: 'password',
    );
    print(res);
    print(res.user!.email);
  }

  _handleSignUpButton() async {
    print('회원가입 버튼');
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: 'test1@gmail.com',
      password: 'password',
    );
  }

  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  @override
  Widget build(BuildContext context) {
    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('아이디를 입력하세요'),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('패스워드를 입력하세요'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: _handleLoginButton, child: Text('로그인하기')),
              ElevatedButton(
                  onPressed: _handleSignUpButton, child: Text('회원가입하기')),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text('로그 아웃')),
              ElevatedButton(onPressed: signInWithGoogle, child: Text('구글 로그인'))
            ]),
      ),
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  print('실행 1');
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn(); // 이게 문제고만
  print('실행 2');

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  print('실행 3');

  // Create a new credential
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  print('실행 4');

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
