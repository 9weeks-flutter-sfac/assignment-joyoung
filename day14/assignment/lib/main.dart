import 'dart:ui';

import 'package:assignment/model/model.dart';
import 'package:assignment/utils/apiutil.dart';
import 'package:assignment/widget/filterbottomsheet.dart';
import 'package:assignment/widget/texttile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<Model>? data;
String url = "https://jsonplaceholder.typicode.com/todos";
TodoFilter todoFilter = TodoFilter.all;

class _MyAppState extends State<MyApp> {
  @override
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(),
            ),
          ),
          title: Text('Todo App'),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => FilterBottomSheet(
                            filter: todoFilter,
                            onApply: (value) {
                              setState(() {
                                todoFilter = value;
                              });
                            },
                          ));
                },
                icon: Icon(Icons.filter_alt)),
            IconButton(
                onPressed: () {
                  getData();
                },
                icon: Icon(Icons.refresh_sharp)),
          ],
        ),
        body: data == null
            ? null
            : ListView.builder(
                itemCount: filterMaker(data!).length,
                itemBuilder: (context, index) {
                  final item = filterMaker(data!)[index];
                  return Dismissible(
                    key: Key(item.id.toString()),
                    onDismissed: (direction) {
                      setState(() {
                        data!.remove(item);
                      });
                    },
                    child: textTile(
                      data: filterMaker(data!)[index],
                    ),
                  );
                },
              ));
  }

  List<Model> filterMaker(List<Model> value) {
    switch (todoFilter) {
      case TodoFilter.all:
        return value;
      case TodoFilter.completed:
        return value.where((element) => element.completed == true).toList();
      case TodoFilter.incompleted:
        return value.where((element) => element.completed == false).toList();
    }
  }
}
