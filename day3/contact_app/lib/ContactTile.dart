import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile(
      {super.key,
      required this.name,
      required this.price,
      required this.imgUrl,
      required this.sub});

  final String name;
  final String price;
  final String imgUrl;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        minLeadingWidth: 60,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            sub,
            style: TextStyle(color: Colors.black26),
          )
        ]),
        subtitle: Text(
          price,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage(imgUrl),
          radius: 30,
        ),
      ),
    );
  }
}
