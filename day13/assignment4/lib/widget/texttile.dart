import 'package:assignment/model/model.dart';
import 'package:flutter/material.dart';

class textTile extends StatelessWidget {
  const textTile({
    super.key,
    required this.data,
  });
  final Model data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(data.id.toString())),
      title: Text(data.title),
      subtitle: Text(data.body),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20 ,left: 10 , right: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(data.body),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
