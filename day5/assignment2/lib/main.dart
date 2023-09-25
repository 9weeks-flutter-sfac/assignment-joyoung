import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('5일차 과제'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => firstAssign()));
                },
                child: Text('1번과제'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20), // 원하는 크기로 조정
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => secondAssign()));
                },
                child: Text('2번과제'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20), // 원하는 크기로 조정
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => thirdAssign()));
                },
                child: Text('3번과제'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20), // 원하는 크기로 조정
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class firstAssign extends StatelessWidget {
  const firstAssign({super.key});
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    List animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];
    return Scaffold(
      appBar: AppBar(
        title: Text('1번 과제'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            scrollController.animateTo(0,
                duration: Duration(milliseconds: 500), curve: Curves.easeIn);
          },
          child: Icon(Icons.vertical_align_top)),
      body: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          return SizedBox(
              height: 300, child: Center(child: Text(animalList[index])));
        },
        itemCount: animalList.length,
      ),
    );
  }
}

class secondAssign extends StatefulWidget {
  const secondAssign({super.key});

  @override
  State<secondAssign> createState() => secondAssignState();
}

class secondAssignState extends State<secondAssign> {
  String userInput = '';
  TextEditingController cleanText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('2번 과제')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userInput = '';
          cleanText.clear();
          setState(() {});
        },
        child: Icon(Icons.close),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            TextField(
              controller: cleanText,
              onChanged: (value) {
                userInput = value;
                setState(() {});
              },
            ),
            Text('입력한 메세지 : $userInput')
          ],
        ),
      ),
    );
  }
}

class thirdAssign extends StatefulWidget {
  const thirdAssign({super.key});

  @override
  State<thirdAssign> createState() => _thirdAssignState();
}

class _thirdAssignState extends State<thirdAssign> {
  var userInput = '';
  bool sun = false;
  bool moon = false;
  bool star = false;

  TextEditingController cleanText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3번 과제'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cleanText.clear();
          userInput = '';
          sun = false;
          moon = false;
          star = false;

          setState(() {});
          print(userInput);
        },
        child: Icon(Icons.refresh),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.sunny,
              color: sun ? Colors.yellow : Colors.grey,
            ),
            title: Text('sun'),
            trailing: TextButton(
              child: Icon(Icons.play_arrow),
              onPressed: () {
                sun = !sun;
                setState(() {});
              },
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.nightlight,
              color: moon ? Colors.yellow : Colors.grey,
            ),
            title: Text('moon'),
            trailing: TextButton(
              child: Icon(Icons.play_arrow),
              onPressed: () {
                moon = !moon;
                setState(() {});
              },
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.star_rate_sharp,
              color: star ? Colors.yellow : Colors.grey,
            ),
            title: Text('star'),
            trailing: TextButton(
              child: Icon(Icons.play_arrow),
              onPressed: () {
                star = !star;
                setState(() {});
              },
            ),
          ),
          TextField(
            controller: cleanText,
            decoration: InputDecoration(border: OutlineInputBorder()),
            onSubmitted: (value) {
              userInput = value;
              setState(() {});

              if (userInput == '태양') {
                sun = !sun;
              } else if (userInput == '달') {
                moon = !moon;
              } else if (userInput == '별') {
                star = !star;
              }
            },
          )
        ],
      ),
    );
  }
}
