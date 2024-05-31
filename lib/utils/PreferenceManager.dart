import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  // static final PreferenceManager _manager = PreferenceManager._wait();
  // PreferenceManager._wait();
  static const String accessTokenKey = "access_token";
  static const String userDataKey = "userData";
  static const String activitiesTypesKey = "activitiesTypes";
  static const String regionsKey = "regions";
  static const String appLanguageKey = "app_language";
  static const String customerTypesKey = "customerTypes";
  static const String leadStatusCategoriesKey = "lead_status_categories";
  static const String listSharedPreferenceKey = "list_shared_preferences";
  static const String boolSharedPreferenceKey = "bool_shared_preferences";

  // Save boolean value
  Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  // Retrieve boolean value
  Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  // Save list of strings
  Future<void> setListString(String key, List<String> value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  // Retrieve list of strings
  Future<List<String>> getListString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  // Save a string value
  Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // Retrieve a string value
  Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  // Save access token
  Future<void> setAccessToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessTokenKey, value);
  }

  // Retrieve access token
  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessTokenKey);
  }

  // Save an integer value
  Future<void> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  // Retrieve an integer value
  Future<int> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  // Save a double value
  Future<void> setDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  // Retrieve a double value
  Future<double> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }

  // Save a map as a JSON string
  Future<void> setMap(String key, Map value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(value));
  }

  // Retrieve a map from a JSON string
  Future<Map<String, dynamic>> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.getString(key) ?? "{}");
  }

  // Clear all shared preferences
  Future<void> clearSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Save a list of generic objects
  Future<void> saveDataList<T>(List<T> dataList, String keyName) async {
    final prefs = await SharedPreferences.getInstance();
    final String data = jsonEncode(dataList);
    await prefs.setString(keyName, data);
  }

  // Retrieve a list of generic objects
  Future<List<T>> getDataList<T>(
      String keyName, T Function(Map<String, dynamic>) fromJson) async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(keyName);

    if (data != null) {
      try {
        final List<dynamic> decodedList = jsonDecode(data);
        return decodedList
            .map<T>((item) => fromJson(item as Map<String, dynamic>))
            .toList();
      } catch (e) {
        // Handle decoding errors
        print('Error decoding data: $e');
      }
    }

    return [];
  }
}
