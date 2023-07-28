import 'package:magdsoft_flutter_structure_master1/util/cach_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    return await sharedPreferences.setStringList(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }
  Future<bool> setOtp(String value) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    return sharedPreferences.setString(CachKeys.otp, value);
  }

  static dynamic getOtp() async {
    return sharedPreferences.getString(CachKeys.otp);
  }

  static dynamic getListOFData({
    required String key,
  }) {
    return sharedPreferences.getStringList(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }
}
