import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static const String _keyToken = "token";

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyToken, token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyToken);
  }
}
