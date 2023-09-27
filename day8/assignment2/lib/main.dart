import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// 정답 5292304
class _MyAppState extends State<MyApp> {
  var data = '';
  List<dynamic> dogImg = [];

  Future<dynamic> getData() async {
    print('겟 데이타 실행');

    var dio = Dio();
    var res = await dio.get(
      "https://sniperfactory.com/sfac/http_day16_dogs",
    );
    // print(res.data['body'].runtimeType);
    return res.data['body'];
  }

  void handleDogImagePost() async {
    dogImg = await getData();
    print(dogImg ?? " 값없음");

    setState(() {});
  }

  Future<dynamic> postData() async {
    print('포스트 데이타 실행 ');

    var dio = Dio();
    var number = 100;
    bool success = true;
    while (success) {
      try {
        var res = await dio.post(
            "https://sniperfactory.com/sfac/http_assignment_${number}",
            // "https://sniperfactory.com/sfac/http_test",

            options: Options(
              headers: {
                'user-agent': 'SniperFactoryBrowser',
                'authorization': 'bearer ez-1234'
              },
            ));

        if (res.statusCode == 200) {
          print('${number} 성공');
          success = false;
          return res.data['result'];
        } else {
          print('실패 숫자증가');
        }
      } catch (e) {
        print('예외 발생: $e');
        print('통신 실패, 다시 시도합니다. Number: $number');
        number += 1;
      }
      if (number > 150) {
        print('${number} 번 시도 후에도 실패');
        success = false;
      }
    }
  }

  void handleOnpressed() async {
    data = await postData();
    setState(() {});
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    dogImg = [];
    setState(() {});
    handleDogImagePost();
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  final Connectivity _connectivity = Connectivity();
  bool networkCheck = true;

  void checkConnectivityWifi() async {
    //wifi, 셀룰러, None 셋 중 하나의 status를 가져오는 변수
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    //핸드폰이 wifi에 연결 되었다면
    if (connectivityResult == ConnectivityResult.none) {
      // I am not connected to any network.
      print('네트워크 연결이 안되었습니다.');
      networkCheck = false;
      setState(() {});
    } else {
      networkCheck = true;
      setState(() {});

      print('네트워크 연결 되었음');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Center(child: Text('8일차 과제'))),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                checkConnectivityWifi();
                // handleDogImagePost();
              },
              child: Icon(Icons.wifi_find_rounded)),
          body: SmartRefresher(
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            enablePullDown: true,
            header: WaterDropHeader(),
            child: Center(
              child: !networkCheck
                  ? Center(child: Text('인터넷을 연결 해주세요'))
                  : Wrap(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                handleOnpressed();
                              },
                              child: Expanded(
                                child: Column(
                                  children: [
                                    Text('8일차 1번 과제 버튼'),
                                    Text(data),
                                  ],
                                ),
                              )),
                          dogImg != null
                              ? Wrap(
                                  children: dogImg
                                      .map(
                                        (e) => Card(
                                          child: Container(
                                            height: 150,
                                            padding: EdgeInsets.all(5),
                                            width: 150,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                            width: 140,
                                                            height: 130,
                                                            fit: BoxFit.cover,
                                                            '${e['url']}'),
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                      child: Text(
                                                    '강아지',
                                                  )),
                                                  Transform.scale(
                                                      scaleX: -1,
                                                      child: Icon(Icons.chat))
                                                ]),
                                          ),
                                        ), // e[msg] 대신 e['msg'] 사용
                                      )
                                      .toList(),
                                )
                              : SizedBox(
                                  width: 200.0,
                                  height: 100.0,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.yellow,
                                    child: Text(
                                      'Shimmer',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ]),
            ),
          )),
    );
  }
}
