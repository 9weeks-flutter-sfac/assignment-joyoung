import 'package:assignment2/model/model.dart';
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

Model? data;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  var dio = Dio();

  void getData() async {
    Response response;
    try {
      response = await dio.get('https://sniperfactory.com/sfac/http_json_data');
      if (response.statusCode == 200) {
        print(response.data.toString());

        data = Model.fromMap(response.data['item']);
        print(data);

        setState(() {});
      }
    } catch (e) {
      print('통신 실패');

      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: data == null
              ? null
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                          image: DecorationImage(
                              image: NetworkImage(data!.image),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${data!.name}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('${data!.description}',
                                    style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${data!.price}원 결제하고 등록'),
                                    ))
                              ]),
                        ),
                      ),
                    )
                  ],
                )),
    );
  }
}
