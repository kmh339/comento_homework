import 'package:comento_homework/login_page.dart';
import 'package:comento_homework/tabs/tabs_main.dart';
import 'package:comento_homework/user_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  App({
    Key key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _login;
  String _nickName;
  final UserRepository _userRepository = UserRepository();

  @override
  void initState() {
    super.initState();

    if (_login == null) {
      _login = false;
    }

    _userRepository.isSignedIn().then((checkLogin) {
      this._login = checkLogin;
    });
    _userRepository.getNickName().then((nickname) {
      this._nickName = nickname;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("login bool == $_login");
    print("nickname == $_nickName");
    return MaterialApp(
      home: _login
          ? TabsMain(
              nickName: _nickName,
            )
          : LoginPage(userRepository: _userRepository,),
    );
  }
}
