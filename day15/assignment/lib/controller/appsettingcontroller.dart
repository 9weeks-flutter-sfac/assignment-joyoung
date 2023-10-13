// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:assignment/main.dart';
import 'package:get/get.dart';

import '../model/model.dart';

class AppSettingController extends GetxController {
  Model model;
  RxInt count;
  AppSettingController({
    required this.model,
    required this.count,
  });

  void increase() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
    });
  }

  @override
  void onInit() {
    super.onInit();
    increase();
    // increment();
    ever(count, (value) {
      print(count);
      if (value % 10 == 0) {
        Get.snackbar('코인 $value 개 돌파 ', '축하합니다');
      }
    });
  }
}

//  bool  isSoundOn 
//  ---  --- 
//  bool  isNotificationOn 
//  String  appVersion 
//  String  appName 
//  String  appAuthor 
//  String  appPackageName 
//  DateTime?  lastUpdated