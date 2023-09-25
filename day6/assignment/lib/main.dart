import 'dart:convert';

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

class _MyAppState extends State<MyApp> {
  var name = [
    '이테디',
    '밀리',
    '크리스',
    '주노',
    '혜리',
    '넬라',
    '헬렌',
    '혜리',
    '넬라',
    '헬렌',
    '혜리',
    '넬라',
    '헬렌'
  ];

  @override
  Widget build(BuildContext context) {
    var pageIndex = 0;
    return Scaffold(
      appBar: AppBar(title: Text("내 연락처"), actions: [
        Icon(Icons.search),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.more_vert)
      ]),
      body: SafeArea(
          child: ListView(
              children: name.map((e) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetailPage(name: '$e'),
                ));
          },
          child: ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                    image: NetworkImage('https://picsum.photos/100/100'))),
            title: Text('$e'),
            subtitle: Text('010-1234-5678'),
            trailing: Icon(Icons.call),
          ),
        );
      }).toList())),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainHistoryScreen(),
                  ));
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainSettingScreen(),
                  ));
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone), label: '연락처'),
          BottomNavigationBarItem(
              icon: Icon(Icons.time_to_leave_outlined), label: '통화기록'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class MainHistoryScreen extends StatelessWidget {
  const MainHistoryScreen({Key? key, this.name = '기본 이름'}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    const pageIndex = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('통화기록'),
      ),
      body: ListView(children: [
        ListTile(
          trailing: Icon(Icons.call_made),
          title: Text('$name'),
        ),
        ListTile(
          trailing: Icon(Icons.call_missed),
          title: Text('$name'),
        ),
        ListTile(
          trailing: Icon(Icons.call_missed),
          title: Text('$name'),
        ),
        ListTile(
          trailing: Icon(Icons.call_missed),
          title: Text('$name'),
        ),
        ListTile(
          trailing: Icon(Icons.call_missed),
          title: Text('$name'),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainHistoryScreen(),
                  ));
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainSettingScreen(),
                  ));
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone), label: '연락처'),
          BottomNavigationBarItem(
              icon: Icon(Icons.time_to_leave_outlined), label: '통화기록'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({
    super.key,
    this.name,
  });
  final name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 100,
          bottom: PreferredSize( preferredSize: Size(double.infinity, 200), child: Container(), ),
          flexibleSpace: Container(
              decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://picsum.photos/100/100'),
                fit: BoxFit.cover),
          )),
          backgroundColor: Colors.transparent,
          // toolbarHeight: 150,
          actions: [Icon(Icons.more_vert)],
          // leading: Icon(Icons.chevron_left),
          title: Text('연락처 상세'),
        ),
        body: ListView(children: [
          ListTile(
            leading: CircleAvatar(
                child: Image.network('https://picsum.photos/100/100')),
            title: Text('$name'),
            subtitle: Text('010-1212-1212'),
            trailing: Icon(Icons.call),
          )
        ]),
      ),
    );
  }
}

class MainSettingScreen extends StatelessWidget {
  const MainSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const pageIndex = 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('통화기록'),
      ),
      body: ListView(children: [
        ListTile(
          title: Text('차단목록'),
        ),
        ListTile(
          title: Text('벨소리 설정'),
        ),
        ListTile(
          title: Text('전화통계'),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainHistoryScreen(),
                  ));
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainSettingScreen(),
                  ));
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone), label: '연락처'),
          BottomNavigationBarItem(
              icon: Icon(Icons.time_to_leave_outlined), label: '통화기록'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
