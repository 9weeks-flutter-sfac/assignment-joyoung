import 'package:assignment/menu.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment/model/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? prefs;
  var dio = Dio();
  List<MenuModel>? data;
  List<String> choice = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPreferences();
    getData();
  }

  void initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      var mylist = prefs!.getStringList('choice') ?? [];
      choice = mylist ?? [];

      setState(() {});
    }
  }

  void getData() async {
    Response response;
    try {
      response = await dio
          .get('http://52.79.115.43:8090/api/collections/options/records');
      if (response.statusCode == 200) {
        data = (response.data['items'] as List<dynamic>)
            .map((item) => MenuModel.fromMap(item))
            .toList();
        print(data![1].menu.toString());
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: choice.isNotEmpty
              ? FloatingActionButton.extended(
                  label: Text('결제하기'),
                  onPressed: () {
                    setState(() {
                      setState(() {
                        choice = [];
                      });
                    });
                  },
                )
              : null,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  '추가한 메뉴',
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: choice.isNotEmpty
                    ? Wrap(
                        children: choice
                            .map((e) => Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Chip(
                                    label: Text(e),
                                    onDeleted: () {
                                      choice.remove(e);
                                      setState(() {});
                                    },
                                  ),
                            ))
                            .toList(),
                      )
                    : Text("주문한 음식이 없습니다"),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  '메뉴',
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: data?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4),
                  itemBuilder: (context, index) {
                    if (data != null) {
                      final item = data![index];
                      return Menu(
                        description: item.description,
                        name: item.menu,
                        img: item.imageUrl,
                        choice: () {
                          if (prefs != null) {
                            prefs!.setStringList('choice', choice);
                          }
                          choice.add(data![index].menu);
                          setState(() {});
                        },
                      );
                    } else {
                      return LinearProgressIndicator(); // 데이터가 없거나 인덱스가 범위를 벗어날 경우 빈 컨테이너를 반환합니다.
                    }
                  },
                ),
              ),
            ],
          )),
    );
  }
}
