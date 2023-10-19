// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB2diud2rdkPHaybBHZZw0fzeZt9QQu6d4',
    appId: '1:261698721960:web:9c3774db17735fe8000a9d',
    messagingSenderId: '261698721960',
    projectId: 'sfac-flutter',
    authDomain: 'sfac-flutter.firebaseapp.com',
    storageBucket: 'sfac-flutter.appspot.com',
    measurementId: 'G-NSPDBWS80L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXPvAC4ZSGYV38jrQoNguE5julOQMt-E0',
    appId: '1:261698721960:android:ec010c5dab56862a000a9d',
    messagingSenderId: '261698721960',
    projectId: 'sfac-flutter',
    storageBucket: 'sfac-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaa9Ix8CDpPy2npnM9qSO6NfmsreagRgY',
    appId: '1:261698721960:ios:5e7cb96d1dbed1d8000a9d',
    messagingSenderId: '261698721960',
    projectId: 'sfac-flutter',
    storageBucket: 'sfac-flutter.appspot.com',
    iosBundleId: 'com.example.firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaa9Ix8CDpPy2npnM9qSO6NfmsreagRgY',
    appId: '1:261698721960:ios:30aa2d46f89a1737000a9d',
    messagingSenderId: '261698721960',
    projectId: 'sfac-flutter',
    storageBucket: 'sfac-flutter.appspot.com',
    iosBundleId: 'com.example.firebase.RunnerTests',
  );
}