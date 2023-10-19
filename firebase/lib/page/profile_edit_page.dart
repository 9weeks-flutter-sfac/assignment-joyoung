import 'package:firebase/controller/profile_edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditPage extends GetView<ProfileEditController> {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '프로필 수정 및 추가',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 16,
              ),
              DropdownButton(
                value: controller.job.value,
                items: [
                  "개발자",
                  "무직",
                  "학생",
                ]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: controller.job,
                hint: Text('직업을 선택하세요'),
              ),
              DropdownButton(
                value: controller.mbti.value,
                items: [
                  "entp",
                  "intp",
                  "infp",
                  "infj",
                ]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: controller.mbti,
                hint: Text('mbti를 선택하세요'),
              ),
              DropdownButton(
                value: controller.bloodtype.value,
                items: [
                  "A",
                  "B",
                  "O",
                ]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: controller.bloodtype,
                hint: Text('혈액형을 선택하세요'),
              ),
              TextButton(
                  onPressed: controller.updateProfile, child: Text('수정하기')),
            ],
          ),
        ),
      ),
    );
  }
}
