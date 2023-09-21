import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, required this.name, required this.img, required this.choice});

  final String name;
  final String img;
  final Function(String) choice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        choice(name);
      }, 
      child: Container(
          margin: EdgeInsets.only( bottom: 8),
          width: 110,
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.black, // 테두리 색상 설정
            width: 1.0,
          )),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(img, height: 100, width: 110, fit: BoxFit.fill),
                Text(
                  name,
                  style: TextStyle( fontWeight: FontWeight.bold),
                ),
                Text('[담기]'),
              ])),
    );
  }
}
