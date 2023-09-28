import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Connectivity _connectivity = Connectivity();
  bool networkCheck = true;

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

  Future<dynamic> getData() async {
    print('강아지 사진을 받아오는 겟 데이타 실행');

    var dio = Dio();
    var res = await dio.get(
      "https://sniperfactory.com/sfac/http_day16_dogs",
    );
    // print(res.data['body'].runtimeType);
    return res.data['body'];
  }

  void handleDogImagePost() async {
    dogImg = [];
    await Future.delayed(Duration(milliseconds: 1000));

    dogImg = await getData();
    print(dogImg ?? " 개의 이미지를 받아오지 못했습니다");

    setState(() {});
  }

  void handleOnpressed() async {
    data = await postData();
    setState(() {});
  }

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

  void checkConnectivityWifi() async {
    networkCheck = false;
    setState(() {});

    await Future.delayed(Duration(milliseconds: 2000));

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
            child: !networkCheck
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpinKitThreeInOut(color: Colors.cyan, size: 50),
                      Text('인터넷을 연결을 확인합니다'),
                    ],
                  )
                : Center(
                    child: Wrap(children: [
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
                          dogImg.isNotEmpty
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Center(
                                                        child: Text(
                                                      '${e['msg']}',
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    )),
                                                  ),
                                                  Transform.scale(
                                                      scaleX: -1,
                                                      child: Icon(Icons.chat))
                                                ]),
                                          ),
                                        ), // e[msg] 대신 e['msg'] 사용
                                      )
                                      .toList(),
                                )
                              : Wrap(children: [
                                  Wrap(children: [
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: Colors.white,
                                      child: Wrap(
                                        children: [
                                          for (var i = 0; i < 6; i++)
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              width: 150,
                                              height: 150,
                                              color: Colors.black12,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ]),
                        ],
                      ),
                    ]),
                  ),
          )),
    );
  }
}
