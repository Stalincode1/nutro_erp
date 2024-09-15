import 'package:client/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:client/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _storage = SharedPreferences.getInstance();

class SharedService {
  static Future<void> setToken(token) async {
    final SharedPreferences storage = await _storage;
    storage.setString("token", token!.toJson());
  }

  static Future<TokenModel?> getToken() async {
    final SharedPreferences storage = await _storage;
    var token = storage.getString("token");
    if (token == null) {
      debugPrint("tokentoken...........");
      SharedService.logggedOutWithOutContext();
    }
    return token != null ? TokenModel.fromJson(token) : null;
  }

  static Future<UserModel?> getUserData() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    String? userJson = storage.getString('user');
    if (userJson != null) {
      return UserModel.fromJson(userJson);
    }
    return null;
  }

  static Future<void> setUserData(UserModel user) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString('user', user.toJson());
  }

  static Future<void> logggedOutWithOutContext() async {
    final SharedPreferences storage = await _storage;
    for (String key in storage.getKeys()) {
      if (!key.startsWith("offlineModel-")) {
        storage.remove(key);
      }
    }
    // NavigatorHelper.navigateToNewRoute(LoginScreen.routeName);
  }
}
