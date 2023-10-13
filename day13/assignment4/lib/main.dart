import 'package:assignment/model/model.dart';
import 'package:assignment/utils/apiutil.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

var url = "https://jsonplaceholder.typicode.com/posts";
List<Model>? data;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    data = await fetchData(url);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: data == null
            ? Text('no data')
            : ListView.builder(
                itemCount: data!.length == 0 ? 0 : data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(data![index].userId.toString()),
                        Text(data![index].id.toString()),
                        Text(data![index].body),
                        Text(data![index].title),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
