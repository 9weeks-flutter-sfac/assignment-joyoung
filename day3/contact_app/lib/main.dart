// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contact_app/ContactTile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Icon(Icons.navigate_before),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'NEW',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ContactTile(
              imgUrl: 'images/item_drink1.jpeg',
              name: '골든 미모사 그린티',
              sub: 'Golden Mimosa Green Tea',
              price: '6100원',
            ),
            ContactTile(
              imgUrl: 'images/item_drink2.jpeg',
              name: '블랙 햅쌀 고봉 라떼',
              sub: 'Golden Mimosa Green Tea',
              price: '6300원',
            ),
            ContactTile(
              imgUrl: 'images/item_drink3.jpeg',
              name: '아이스 블랙 햅쌀 고봉 라떼',
              sub: 'Golden Mimosa Green Tea',
              price: '6300원',
            ),
            ContactTile(
              imgUrl: 'images/item_drink4.jpeg',
              name: '스타벅스 튜메릭 라떼',
              sub: 'Golden Mimosa Green Tea',
              price: '6100원',
            ),
            ContactTile(
              imgUrl: 'images/item_drink5.jpeg',
              name: '아이스 스타벅스 튜메릭 라떼',
              sub: 'Golden Mimosa Green Tea',
              price: '6100원',
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Icon(Icons.add),
        // ),
        bottomSheet: Container(
          height: 64,
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "주문할 매장을 선택해 주세요",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // Spacer(), 다른방법
              Icon(
                Icons.expand_more,
                color: Colors.white,
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          currentIndex: 2,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Pay'),
            BottomNavigationBarItem(icon: Icon(Icons.coffee), label: 'Order'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'Other'),
          ],
        ),
      ),
    );
  }
}
