import 'package:flutter/material.dart';

class dogDetail extends StatelessWidget {
  const dogDetail({super.key, this.dog});
  final dog;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(dog.message),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("close"))
          ],
        ),
      ),
    );
  }
}
