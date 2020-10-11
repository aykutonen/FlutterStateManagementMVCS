import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences _instance;
  static SharedPreferences get instance => _instance;

  static Future<SharedPreferences> init() async {
    _instance = await SharedPreferences.getInstance();
    return _instance;
  }

  static String getString(String key, [String defValue]) {
    return instance.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    return await instance.setString(key, value) ?? Future.value(false);
  }

  static bool getBool(String key, [bool defValue]) {
    return instance.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    return await instance.setBool(key, value) ?? Future.value(false);
  }

  static Future<bool> setInt(String key, int value) async {
    return await instance.setInt(key, value) ?? Future.value(false);
  }

  static int getInt(String key) {
    return instance.getInt(key) ?? Future.value(null);
  }
}
