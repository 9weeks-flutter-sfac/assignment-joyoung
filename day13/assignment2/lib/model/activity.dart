// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Activity {

  String activity;
  String type;
  int participants;
  int price;
  String? link;
  String key;
  double? accessibility;
  Activity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    this.link,
    required this.key,
    this.accessibility,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activity': activity,
      'type': type,
      'participants': participants,
      'price': price,
      'link': link,
      'key': key,
      'accessibility': accessibility,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      activity: map['activity'] ,
      type: map['type'] ,
      participants: map['participants'] ,
      price: map['price'] is double ? map['price'].toInt() : map['price']  ,
      link: map['link'] != null ? map['link'] as String : null,
      key: map['key'] as String,
      accessibility: map['accessibility']  is double ? map['accessibility'].toInt() : map['accessibility'] ,
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) => Activity.fromMap(json.decode(source) as Map<String, dynamic>);
}
