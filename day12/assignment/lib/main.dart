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
  List<String> select = [];
  SharedPreferences? prefs;
  var dio = Dio();
  List<MenuModel>? data;

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
      select = prefs!.getStringList('selected') ?? [];
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

  var choice = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                select!.add('asd');
              });
              if (prefs != null) {
                prefs!.setStringList('selected', select!);
              }
            },
          ),
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
                height: 50,
                alignment: Alignment.center,
                child: choice.isNotEmpty
                    ? ListView.builder(
                        itemCount: choice.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Chip(
                            label: Text(choice[index]),
                            onDeleted: () {
                              choice.removeAt(index);
                              setState(() {});
                            },
                          );
                        },
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
                  itemCount: data?.length ?? 0 ,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4),
                  itemBuilder: (context, index) {
                    if (data != null ) {
                      final item = data![index];
                      return Menu(
                        description: item.description,
                        name: item.menu,
                        img: item.imageUrl,
                        choice: (name) {
                          choice.add(name);
                          print(name);
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
