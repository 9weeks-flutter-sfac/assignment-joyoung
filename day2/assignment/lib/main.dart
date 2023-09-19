import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              ListTile(
                title: Text('서클아바타'),
                subtitle: Text('011000555'),
                leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/100/100',
                    )),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('클립렉트'),
                subtitle: Text('011000555'),
                leading: ClipRRect(
                    child: Image.network('https://picsum.photos/100/100'),
                    borderRadius: BorderRadius.circular(99)),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('콘테이너'),
                subtitle: Text('011000555'),
                leading: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(99),
                      shape: BoxShape.circle),
                  child: Image.network('https://picsum.photos/100/100'),
                ),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('콘테이너 쉐이프'),
                subtitle: Text('011000555'),
                leading: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(99),
                      shape: BoxShape.circle),
                  child: Image.network('https://picsum.photos/100/100'),
                ),
                trailing: Icon(Icons.call),
              ),
              // SingleChildScrollView(
              //   child: Container(
              //     width: 300,
              //     height: 800,
              //     child: Text(
              //       'asd',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20,
              //       ),
              //     ),
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //         color: Colors.black26,
              //         border: Border.all(),
              //         borderRadius: BorderRadius.circular(16),
              //         gradient: LinearGradient(
              //             begin: Alignment.topLeft,
              //             end: Alignment.bottomRight,
              //             colors: [
              //               Colors.red,
              //               Colors.blue,
              //             ]),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black,
              //             blurRadius: 4,
              //             spreadRadius: 1,
              //             offset: Offset(30.2, 30),
              //           )
              //         ]),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
