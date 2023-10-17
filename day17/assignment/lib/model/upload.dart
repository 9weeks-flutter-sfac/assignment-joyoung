import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UploadModel {
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  String secret;
  String author;
  String authorName;
  UploadModel({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.secret,
    required this.author,
    required this.authorName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created.millisecondsSinceEpoch,
      'updated': updated.millisecondsSinceEpoch,
      'secret': secret,
      'author': author,
      'authorName': authorName,
    };
  }

  factory UploadModel.fromMap(Map<String, dynamic> map) {
    return UploadModel(
      id: map['id'] as String,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
      updated: DateTime.fromMillisecondsSinceEpoch(map['updated'] as int),
      secret: map['secret'] as String,
      author: map['author'] as String,
      authorName: map['authorName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UploadModel.fromJson(String source) =>
      UploadModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
