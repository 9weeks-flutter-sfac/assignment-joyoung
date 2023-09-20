import 'package:flutter/material.dart';
import 'package:youtube/MusicTile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.navigate_before),
        title: Text('아워리스트'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.monitor_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: ListView(children: [
          ContactTile(
            img: 'images/music_come_with_me.png',
            name: 'come with me',
            sub: 'surfaces 및 salem liese 3:00 ',
          ),
          ContactTile(
            img: 'images/music_good_day.png',
            name: 'music_good_day',
            sub: 'surfaces 및 salem liese 3:00 ',
          ),
          ContactTile(
            img: 'images/music_honesty.png',
            name: 'music_honesty',
            sub: 'surfaces 및 salem liese 3:00 ',
          ),
          ContactTile(
            img: 'images/music_i_wish_i_missed_my_ex.png',
            name: 'music_i_wish_i_missed_my_ex',
            sub: 'surfaces 및 salem liese 3:00 ',
          ),
          ContactTile(
            img: 'images/music_plastic_plants.png',
            name: 'music_plastic_plants',
            sub: 'surfaces 및 salem liese 3:00 ',
          ),
          ContactTile(
            img: 'images/music_sucker_for_you.png',
            name: 'music_sucker_for_you',
            sub: 'surfaces 및 salem liese 3:00 ',
          )
        ]),
      ),
      bottomSheet: Container(
        child: Column(
          children: [
            ListTile(
              leading: ClipRRect(
                child: Image.asset('images/music_come_with_me.png'),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  'come with me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              subtitle: Text(
                'day6',
                style: TextStyle(color: Colors.white60),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.play_arrow, color: Colors.white),
                  ),
                  Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                height: 1,
                width: 500,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.white, Colors.grey, Colors.grey]),
                  ),
                ),
              ),
            )
          ],
        ),
        height: 70,
        color: Colors.grey[850],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[850],
        currentIndex: 2,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[500],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: '둘러보기',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_music,
            ),
            label: '보관함',
          ),
        ],
      ),
    ));
  }
}
