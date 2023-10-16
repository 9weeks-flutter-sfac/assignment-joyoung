import 'package:assignment/model/searchmodel.dart';
import 'package:assignment/utils/apiutil.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.word});
  final String word;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

List<SearchModel>? data;
String url = "https://api.dictionaryapi.dev/api/v2/entries/en/";

class _SearchPageState extends State<SearchPage> {
  void getData(String serch) async {
    data = await ApiUtil(url + serch);
    if (data != null) {
      setState(() {});
    }
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
      appBar: AppBar(),
      body: data == null
          ? null
          : Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('검색어 ${widget.word}'),
                    Text(data![0].phonetic),
                    Text(data!.first.meanings[0].partOfSpeech),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data!.first.meanings[0].definitions.length,
                        itemBuilder: (context, index) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(data!.first.meanings[0].definitions[index]
                                    .definition),
                              ]);
                        },
                      ),
                    ),
                    Text(data!.first.meanings[1].partOfSpeech),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data!.first.meanings[1].definitions.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(data!.first.meanings[1]
                                      .definitions[index].definition),
                                ]),
                          );
                        },
                      ),
                    ),
                  ]),
            ),
    );
  }
}
