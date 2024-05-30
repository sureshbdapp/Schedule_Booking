import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static const String ACCESS_TOKEN = "access_token";
  static const doubleSharedPreference = "double shared preferences";
  static const stringSharedPreference = "string shared preferences";
  static const mapSharedPreference = "map shared preferences";
  static const USERDATA = "userData";
  static const ACTIVITIES_TYPES = "activitiesTypes";
  static const REGIONS = "regions";
  static const APP_LANGUAGE = "app_language";
  static const CUSTOMER_TYPES = "customerTypes";
  static const LEAD_STATUS_CATEGORIES = "lead_status_categories";

  static const listSharedPreference = "list shared preferences";
  static const boolSharedPreference = "bool shared preferences";

  static Future setBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, true);
  }

  static Future<bool> getBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future setListString(
      {required String id, required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(listSharedPreference, [id, token]);
  }

  static Future<List<String>> getListString() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(listSharedPreference) ?? [];
  }

  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(ACCESS_TOKEN) ?? "";
  }

  static Future setAccessToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(ACCESS_TOKEN, value);
  }

  static Future setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future setInt(String key, int val) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, val);
  }

  static Future<int> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static Future setDouble(String key, double val) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(key, val);
  }

  static Future<double> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }

  static Future setMap(String key, Map value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, jsonEncode(value));
  }

  static Future<Map> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.getString(key) ?? "") ?? {};
  }

  static Future clearSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // static Future<void> saveUser(UserDetails userDetails) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String userJson = json.encode(userDetails.toJson());
  //   prefs.setString(USERDATA, userJson);
  // }
  //
  // static Future<UserDetails?> getUser() async {
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   String? userJson = prefs.getString(USERDATA);
  //
  //   if (userJson != null) {
  //     // Convert JSON string to User object
  //     UserDetails user = UserDetails.fromJson(json.decode(userJson));
  //     return user;
  //   } else {
  //     print('User not found in SharedPreferences');
  //   }
  //   return null;
  // }

  static Future<void> saveDataList<T>(List<T> dataList, String keyName) async {
    final prefs = await SharedPreferences.getInstance();
    final String data = jsonEncode(dataList);
    prefs.setString(keyName, data);
  }

  static Future<List<T>> getDataList<T>(
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
        // Handle decoding errors (e.g., invalid JSON)
        print('Error decoding data: $e');
      }
    }

    return [];
  }
}
