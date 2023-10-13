// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  increment() {
    interval(count, (callback) => count.value += 1);
    update();
  }

  // increment(){
  // 	count++;
  //   update();
  // }
  @override
  void onInit() {
    super.onInit();
    print('실행 ${count.value +1}');
    interval(count, (callback) => count.value += 1);
    // increment();
    ever(
        count,
        (value) => {
              if (value == 0)
                {
                  Get.to(() => main()),
                }
              else
                {
                  print(value),
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