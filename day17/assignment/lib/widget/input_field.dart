import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({super.key, required this.label, required this.controller});
  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
            labelText: '${label}',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
                controller: controller,
      ),
    );
  }
}
