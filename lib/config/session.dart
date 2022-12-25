import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class Session {
  static Future<User?> getUser() async {
    User? currentUser;
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? stringUser = pref.getString('user');
    if (stringUser != null) {
      Map<String, dynamic> mapUser = jsonDecode(stringUser);
      currentUser = User.fromJson(mapUser);
    }
    return currentUser;
  }

  static Future<bool> setUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Map<String, dynamic> mapUser = user.toJson();
    String stringUser = jsonEncode(mapUser);
    return await pref.setString('user', stringUser);
  }

  static Future<bool> clearUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.remove('user');
  }
}
