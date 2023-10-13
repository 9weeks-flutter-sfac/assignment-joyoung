import 'package:assignment/model/model.dart';
import 'package:flutter/material.dart';

class textTile extends StatelessWidget {
  const textTile({super.key, required this.data, });
  final Model data;
  
  @override
  Widget build(BuildContext context) {
    bool boolean = !data.completed;
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: boolean ? null : Colors.green.shade100,
          border: boolean ? null : Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        textColor: boolean ? null : Colors.green,
        iconColor: boolean ? null : Colors.green,
        title: Text(data.title),
        trailing: boolean ? null : Icon(Icons.check_circle_outline),
      ),
    );
  }
}
