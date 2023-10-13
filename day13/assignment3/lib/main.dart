import 'package:assignment3/model/dogmodel.dart';
import 'package:assignment3/utils/fetchData.dart';
import 'package:assignment3/widget/dog_detail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

var url = "https://dog.ceo/api/breeds/image/random";

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: fetchData(url),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    DogModel data = snapshot.data!;
                    if (data.status == "success") {
                      return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return dogDetail(dog: snapshot.data);
                                });
                            print('asd');
                          },
                          child: Image.network(
                            data.message,
                            fit: BoxFit.cover,
                          ));
                    } else {
                      return SizedBox();
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              );
            },
          ),
        ));
  }
}
