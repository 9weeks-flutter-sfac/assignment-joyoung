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

  createDocument(String docId, String title) async {
    var res = await instance
        .collection('memo')
        .doc(docId)
        .set({'title': title, 'isFinished': false});
    print(docId);
  }

  readFinishedDocument() async {
    var res = await instance
        .collection('memo')
        .where('isFinished', isEqualTo: true)
        .get();
    print(res.docs);
    print(res.size);
  }

  updateDocument(String docId, Map<String, dynamic> data) {
    instance.collection('memo').doc(docId).update(data);
  }

  deleteDocument(String docId) async {
    instance.collection('memo').doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (items.isNotEmpty)
              ...items.map((e) => Text(e['title'])).toList(),
            TextButton(
                onPressed: () {
                  getDoucument('vcRQIYabmRZdJMdFXtph');
                },
                child: Text('전달된 vcRQIYabmRZdJMdFXtph의 데이타 가져오기')),
            TextButton(
                onPressed: () {
                  readFromCloudFireStrore();
                },
                child: Text('데이타 가져오기')),
            TextButton(
                onPressed: () {
                  createDocument('123456789', '노래방 가서 노래부르기');
                },
                child: Text('문서 추가 (지정아이디)')),
            TextButton(
                onPressed: () {
                  readFinishedDocument();
                },
                child: Text('data')),
            TextButton(
                onPressed: () {
                  updateDocument('123456789', {'isFinished': false});
                },
                child: Text('문서 수정')),
            TextButton(
                onPressed: () {
                  deleteDocument('123456789');
                },
                child: Text('문서 삭제')),
          ],
        ),
      ),
    );
  }
}
