import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pageCotroller = PageController();
    List<Map<String, String>> words = [
      {"word": "apple", "meaning": "사과", "example": "I want to eat an apple"},
      {
        "word": "paper",
        "meaning": "종이",
        "example": "Could you give me a paper"
      },
      {
        "word": "resilient",
        "meaning": "탄력있는, 회복력있는",
        "example": "She's a resilient girl"
      },
      {
        "word": "revoke",
        "meaning": "취소하다",
        "example":
            "The authorities have revoked their original decision to allow development of this rural area."
      },
      {
        "word": "withdraw",
        "meaning": "철회하다",
        "example":
            "After lunch, we withdrew into her office to finish our discussion in private."
      },
    ];
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: PageView.builder(
          controller: pageCotroller,
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                words[index]['word'].toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                words[index]['meaning'].toString(),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                words[index]['example'].toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          itemCount: words.length,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            FloatingActionButton(
              child: Icon(Icons.navigate_before),
              onPressed: () {
                pageCotroller.previousPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.navigate_next),
              onPressed: () {
                pageCotroller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
            )
          ]),
        ),
      ),
    );
  }
}
