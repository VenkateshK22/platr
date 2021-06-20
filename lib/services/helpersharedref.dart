import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  static String userLoggedinKey = "USERLOGGEDINKEY";

  static String userLoggedinKey2 = "USERLOGGEDINKEY";

  static saveUserLoginDetails(bool isLoggedin) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(userLoggedinKey, isLoggedin);
  }

  static Future<bool> getUserLoginDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(userLoggedinKey);
  }
}
