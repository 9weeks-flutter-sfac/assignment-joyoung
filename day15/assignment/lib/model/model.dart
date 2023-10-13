
class Model {
  bool isSoundOn;
  bool isNotificationOn;
  String appVersion;
  String appName;
  String appAuthor;
  String appPackageName;
  DateTime? lastUpdated;
  Model({
    required this.isSoundOn,
    required this.isNotificationOn,
    required this.appVersion,
    required this.appName,
    required this.appAuthor,
    required this.appPackageName,
    this.lastUpdated,
  });

  
}
