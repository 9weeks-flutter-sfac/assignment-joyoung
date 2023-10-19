import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List items = [];
  var instance = FirebaseFirestore.instance;
  readFromCloudFireStrore() async {
    var res = await instance.collection('memo').get();
    setState(() {
      items = res.docs.map((e) => e.data()).toList();
    });
  }

  getDoucument(String document) async {
    //vcRQIYabmRZdJMdFXtph
    var res = await instance.collection('memo').doc(document).get();
    print(res.data());
    // setState(() {
    //   items = res.data();
    // });
  }

  createDocument(String title) async {
    var res = await instance
        .collection('memo')
        .add({'title': title, 'isFinished': false});
  }

  readFinishedDocument() async {
    var res = await instance
        .collection('memo')
        .where('isFinished', isEqualTo: true)
        .get();
    print(res.docs);
    print(res.size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (items.isNotEmpty) ...items.map((e) => Text(e['title'])).toList(),
          TextButton(
              onPressed: () {
                getDoucument('vcRQIYabmRZdJMdFXtph');
              },
              child: Text('선택 데이타 가져오기')),
          TextButton(
              onPressed: () {
                readFromCloudFireStrore();
              },
              child: Text('데이타 다 가져오기')),
          TextButton(
              onPressed: () {
                readFinishedDocument();
              },
              child: Text('data')),
          TextButton(
              onPressed: () {
                createDocument('책방가서 책읽기');
              },
              child: Text('문서 추가')),
        ],
      ),
    );
  }
}
