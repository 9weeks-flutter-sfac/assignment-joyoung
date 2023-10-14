import 'package:assignment/model/model.dart';
import 'package:assignment/utils/apiutil.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.word});
  final String word;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

var data;
String url = "https://api.dictionaryapi.dev/api/v2/entries/en/";

class _SearchPageState extends State<SearchPage> {
  void getData(String serch) async {
    data = await ApiUtil(url + serch);
    print(data);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.word);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('검색어 ${widget.word}'),
            if (data != null) Text(data.toString())
          ]),
    );
  }
}
