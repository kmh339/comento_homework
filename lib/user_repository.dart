import 'dart:async';
import 'package:meta/meta.dart';
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
    String accessToken = prefs.getString('nickName');
    if (accessToken != null) {
      return true;
    } else {
      return false;
    }
  }
}