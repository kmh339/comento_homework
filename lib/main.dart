import 'package:comento_homework/login_page.dart';
import 'package:comento_homework/tabs/apple.dart';
import 'package:comento_homework/tabs/tabs_main.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({
    Key key,
}) : super(key: key);

  bool _login = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: _login ? TabsMain() : LoginPage(),
    );
  }
}