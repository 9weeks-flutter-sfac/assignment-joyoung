import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.name,
    required this.sub,
    required this.img,
  });

  final String name;
  final String sub;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        minLeadingWidth: 60,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ]),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(children: [
              WidgetSpan(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              TextSpan(
                text: sub,
                style: TextStyle(color: Colors.grey),
              )
            ])),
          ],
        ),
        leading: ClipRRect(
          child: Image.asset(img),
          borderRadius: BorderRadius.circular(5),

        ),
        trailing: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
    );
  }
}
