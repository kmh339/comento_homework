import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<void> persistNickName(String nickName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('nickName', nickName);
    return;
  }

  Future<String> getNickName() async {
    final prefs = await SharedPreferences.getInstance();
    String nickName = prefs.getString('nickName');
    return nickName;
  }

  Future<bool> isSignedIn() async {
    final prefs = await SharedPreferences.getInstance();
    bool checkValue = prefs.containsKey('nickName');
    return checkValue;
  }
}