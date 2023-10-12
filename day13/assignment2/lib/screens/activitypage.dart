import 'package:assignment2/model/activity.dart';
import 'package:assignment2/utils/apiutil.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  Activity? data;

  getDate() async {
    var url = "https://www.boredapi.com/api/activity";
    var response = await ApiUtil(url);
    data = Activity.fromMap(response.data);

    print(data?.accessibility);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('지루할 때 해야할 일')),
      body: data == null
          ? null
          : Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("activity :" + data!.activity),
                    Text("type :" + data!.type),
                    Text(data!.participants.toString()),
                    Text(data!.price.toString()),
                    Text(data!.link ?? "데이타가 없음"),
                    Text(data!.key),
                    Text(data!.accessibility.toString()),
                  ]),
            ),
    );
  }
}
