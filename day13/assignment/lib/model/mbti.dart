class MbtiModel {
  String nickname;
  String name;
  MBTI? mbti;
  bool solo;
  List<String> favoriteFood;

  MbtiModel({
    required this.nickname,
    required this.name,
    required this.mbti,
    required this.solo,
    required this.favoriteFood,

  });

  MbtiModel.fromMap(Map<String, dynamic> map)
      : nickname = map['nickname'],
        name = map['name'],
        mbti = map['mbti'],
        solo = map['solo'],
        favoriteFood = map['favoriteFood'];

}

enum MBTI {
  INFP,
  INFJ,
  ENTJ,
  ISFP,
  isfp,
  entp,
  istp,
}
