import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FirstPage()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var idController = TextEditingController(text: 'default ID');
    var pwController = TextEditingController(text: 'default PW');
    var pageController = PageController();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageController.nextPage(
              duration: Duration(milliseconds: 500), curve: Curves.easeIn);
        },
        child: Icon(Icons.navigate_next),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              /// 페이지뷰 사용법
              height: 40,
              color: Colors.black12,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  Text('텍스트필드'),
                  Text('asd'),

                ],
              ),
            ),
            TextField(
              controller: idController,
            ),
            TextField(
              controller: pwController,
              obscureText: true,
            ),
            TextButton(
                onPressed: () {
                  idController.text = '';
                  pwController.text = '';
                },
                child: Text('Erase')),
            TextButton(
                onPressed: () {
                  print('id : ' + idController.text);
                  print('pw : ' + pwController.text);
                },
                child: Text('print')),
            TextButton(
                onPressed: () {
                  idController.text = 'inset Id';
                  pwController.text = 'inset Pw';
                },
                child: Text('iset')),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('fistPage'),
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondPage()));
          },
          child: Icon(Icons.add)),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        child: Text('navigator PoP'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        backgroundColor: Colors.green,
      ),
    );
  }
}
