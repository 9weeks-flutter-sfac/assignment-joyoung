import 'package:assignment/model/model.dart';
import 'package:assignment/utils/apiutil.dart';
import 'package:assignment/widget/texttile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileState();
}

List<Profile>? data;
String url = "https://jsonplaceholder.typicode.com/users";

class _ProfileState extends State<ProfilePage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    data = await ApiUtil(url);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data == null
          ? null
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('My contacts'),
                Expanded(
                  child: ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return textTile(
                        profile: data![index],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
