import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpModel {
  bool emailVisibility;
  bool verified;
  SignUpModel({
    required this.emailVisibility,
    required this.verified,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'emailVisibility': emailVisibility,
      'verified': verified,
    };
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      emailVisibility: map['emailVisibility'] as bool,
      verified: map['verified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) => SignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

void main() {
  var data = {
    "avatar": "",
    "collectionId": "_pb_users_auth_",
    "collectionName": "users",
    "created": "2023-10-17 16:12:52.753Z",
    "emailVisibility": false,
    "id": "9gys9kn3ssv2c0i",
    "name": "",
    "updated": "2023-10-17 16:12:52.753Z",
    "username": "qawokdaowkd",
    "verified": false
  };
  var a = SignUpModel.fromMap(data);
  print(a.toMap());
}
