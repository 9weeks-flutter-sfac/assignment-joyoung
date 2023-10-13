import 'package:assignment/model/model.dart';
import 'package:assignment/utils/apiutil.dart';
import 'package:assignment/widget/texttile.dart';
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
      theme: ThemeData.dark(),
      home: Scaffold(
        body: data == null
            ? Text('no data')
            : ListView.builder(
                itemCount: data!.length == 0 ? 0 : data!.length,
                itemBuilder: (context, index) {
                  if (index > 0 && index % 5 == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'POST ${index - 4} ~ ${index}',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        textTile(data: data![index]),
                      ],
                    );
                  } else {
                    return textTile(data: data![index]);
                  }
                },
              ),
      ),
    );
  }
}
