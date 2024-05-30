// AppConfig.dart

class AppDelegate {
  static final AppDelegate _instance = AppDelegate._internal();

  factory AppDelegate() {
    return _instance;
  }
  //UserDetails? userDetails;
  bool surveyFilled = false;
  AppDelegate._internal();

  void reset() {
    //userDetails=null;
    surveyFilled = false;
  }
}
