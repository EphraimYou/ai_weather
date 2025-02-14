import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPref;

  static Future init() async {
    return sharedPref = await SharedPreferences.getInstance();
  }

  /* -------------------------------------------------------------------------- */
  /*                        set data in shared preferences                       */
  /* -------------------------------------------------------------------------- */

  static Future<bool> saveData({required String key, required value}) async {
    if (value is String) {
      return await sharedPref!.setString(key, value);
    }
    if (value is bool) {
      return await sharedPref!.setBool(key, value);
    }
    if (value is int) {
      return await sharedPref!.setInt(key, value);
    }
    if (value is double) {
      return await sharedPref!.setDouble(key, value);
    } else {
      return await sharedPref!.setDouble(key, value);
    }
  }

  /* -------------------------------------------------------------------------- */
/*                       get data from shared preferences                      */
/* -------------------------------------------------------------------------- */

  static dynamic getData({required String key}) {
    return sharedPref!.get(key);
  }

  static Future<bool> removeDate({required String key}) async {
    return await sharedPref!.remove(key);
  }
}
