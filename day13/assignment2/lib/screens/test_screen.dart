import 'package:assignment2/services/slip_service.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: SlipService().getSlip(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
          }
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
