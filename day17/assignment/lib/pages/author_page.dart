import 'package:animate_do/animate_do.dart';
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
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text('뒤로가기', style: TextStyle(color: Colors.white)),
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background/bamboo2.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: FutureBuilder(
          future: controller.fetchAuthorData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    if (snapshot.data != null &&
                        index < snapshot.data!.length) {
                      return ZoomIn(
                        delay: Duration(milliseconds: 200 * index),
                        child: Column(
                          children: [
                            if (snapshot.data![index].avatar != null)
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(snapshot.data![index].avatar),
                              ),
                            if (snapshot.data![index].avatar == null)
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('images/avatar/catmom.jpg'),
                              ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              snapshot.data![index].collectionId ?? "Unknown",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    }
                    return SizedBox(); // Handle the case when data is null or index is out of range.
                  },
                );
              } else {
                return Text("No Data"); // Handle the case when there's no data.
              }
            }
            return CircularProgressIndicator(); // Show a loading indicator while waiting for data.
          },
        ),
      ),
    );
  }
}
