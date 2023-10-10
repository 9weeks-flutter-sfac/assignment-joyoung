import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu(
      {super.key,
      required this.name,
      required this.img,
      required this.choice,
      required this.description});

  final String name;
  final String img;
  final String description;
  final Function(String) choice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        choice(name);
      },
      child: Card(
          child: Expanded(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Image.network(img, fit: BoxFit.cover)),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                description,
                style: TextStyle(fontSize: 12),
              ),
              Text('[담기]'),
            ]),
      )),
    );
  }
}
