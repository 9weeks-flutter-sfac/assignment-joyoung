import 'package:flutter/material.dart';
import 'package:kiosk/menu.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  List<String> food = [];
  @override
  Widget build(BuildContext context) {
    showResultDialog(BuildContext context, var result) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 150,
              child: Center(
                  child: Text(
                "$result",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          title: GestureDetector(
              onDoubleTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminPage(),
                    ));
              },
              child: Text('분식왕 이테디 주문하기'))),
      floatingActionButton: food.isEmpty
          ? null
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              onPressed: () {
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '결제하기',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '주문리스트',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: food.isNotEmpty
                  ? ListView.builder(
                      itemCount: food.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Chip(
                          label: Text(food[index]),
                          onDeleted: () {
                            food.removeAt(index);
                            setState(() {});
                          },
                        );
                      },
                    )
                  : Text("주문한 음식이 없습니다"),
            ),
            Text(
              '음식',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 18,
              children: [
                Menu(
                  name: '맥주',
                  img: 'images/option_beer.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '떡볶이',
                  img: 'images/option_bokki.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '김밥',
                  img: 'images/option_kimbap.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '오무라이스',
                  img: 'images/option_kimbap.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '돈까스',
                  img: 'images/option_pork_cutlets.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '라면',
                  img: 'images/option_ramen.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
                Menu(
                  name: '우동',
                  img: 'images/option_udon.png',
                  choice: (name) {
                    food.add(name);
                    setState(() {});
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text('메뉴 추가하기'),
          ),
          ListTile(
            title: Text('키오스크 화면 잠그기'),
          ),
          ListTile(
            title: Text('매장 등록 정보'),
          )
        ],
      ),
    );
  }
}
