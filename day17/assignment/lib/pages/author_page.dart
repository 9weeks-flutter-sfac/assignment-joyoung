import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/author_controller.dart';

class AuthorPage extends GetView<AuthorController> {
  const AuthorPage({super.key});
  static const String route = '/author';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('뒤로가기'),
        centerTitle: false,
        elevation: 0,
      ),
      // body: Container(
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //         image: DecorationImage(
      //             image: AssetImage('assets/images/background/bamboo2.jpg'),
      //             fit: BoxFit.cover,
      //             colorFilter:
      //                 ColorFilter.mode(Colors.black54, BlendMode.darken))),
      //     child: FutureBuilder(
      //       future: controller.Secret,
      //       builder: (context, snapshot) {
      //         if (snapshot.connectionState == ConnectionState.done) {
      //           return GridView.builder(
      //             itemCount: snapshot.data?.length,
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 3),
      //             itemBuilder: (context, index) {
      //               return ZoomIn(
      //                 delay: Duration(milliseconds: 200 * index),
      //                 child: Column(
      //                   children: [
      //                     CircleAvatar(
      //                         radius: 43,
      //                         backgroundImage:
      //                             NetworkImage(snapshot.data![index].avatar!)),
      //                     SizedBox(
      //                       height: 10,
      //                     ),
      //                     Text(
      //                       snapshot.data![index].username,
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                   ],
      //                 ),
      //               );
      //             },
      //           );
      //         }
      //         return SizedBox();
      //       },
      //     )),
    );
  }
}
