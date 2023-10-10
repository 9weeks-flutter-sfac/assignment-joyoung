import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPreferences();
    request();
  }

  void initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      select = prefs!.getStringList('selected') ?? [];
      setState(() {});
    }
  }

  void request() async {
    Response response;
    try {
      response = await dio
          .get('http://52.79.115.43:8090/api/collections/options/records');
      if (response.statusCode == 200) {
        data = response.data['items'];
        print(data.toString());
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('주문리스트'),
            Text("$select"),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  Text("${data.toString()}");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
