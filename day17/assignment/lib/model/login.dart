import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginModel {
  String id;
  String email;
  String username;
  LoginModel({
    required this.id,
    required this.email,
    required this.username,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'username': username,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      id: map['id'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

void main() {
  var data = {
    "record": {
      "avatar": "",
      "collectionId": "_pb_users_auth_",
      "collectionName": "users",
      "created": "2023-10-17 15:26:57.858Z",
      "email": "1q2w3e4r@gmail.com",
      "emailVisibility": false,
      "id": "plkttjnr7q0mhi3",
      "name": "",
      "updated": "2023-10-17 15:26:57.858Z",
      "username": "users72356",
      "verified": false
    },
    "token":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2xsZWN0aW9uSWQiOiJfcGJ_fdXNlcnSfYXV0aF8iLCJleHAiOjE2OTg3Njk2NzIsImlkIjoicGxrdHRqbnI3cTBtaGkzIiwidHlwZSI6ImF1dGhSZWNvcmQifQ.OVJsLR966sVTbBLBzi7XFPcApqsq9lT1PCon_UO0r48"
  };

  var a = LoginModel.fromMap(data);
  print(a.toMap());
}


// {
//   "token": "JWT_TOKEN",
//   "record": {
//     "id": "RECORD_ID",
//     "collectionId": "_pb_users_auth_",
//     "collectionName": "users",
//     "created": "2022-01-01 01:00:00Z",
//     "updated": "2022-01-01 23:59:59Z",
//     "username": "username123",
//     "verified": false,
//     "emailVisibility": true,
//     "email": "test@example.com",
//     "name": "test",
//     "avatar": "filename.jpg"
//   }
// }