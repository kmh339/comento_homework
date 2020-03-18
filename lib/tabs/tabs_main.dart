import 'package:comento_homework/main.dart';
import 'package:comento_homework/tabs/apple_screen.dart';
import 'package:comento_homework/tabs/banana_screen.dart';
import 'package:comento_homework/tabs/coconut_screen.dart';
import 'package:flutter/material.dart';


class TabsMain extends StatefulWidget {
  final String _nickName;

    TabsMain({
      Key key,
      @required String nickName,
}) : assert(nickName != null),
    _nickName = nickName,
          super(key: key);

    State<TabsMain> createState() => _TabsMainState();
}

class _TabsMainState extends State<TabsMain>{
  int _selectedIndex = 0;

  String get _nickName => widget._nickName;

  void _onItemTapped(int index) {
    setState(() {
      print(" _onItemTapped : $index");
      print("_nickName : $_nickName");
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    AppleScreen(),
    BananaScreen(),
    CoconutScreen(),
  ];


  Widget bottomNavigator(BuildContext context) {

    final double _height = MediaQuery.of(context).size.height;


    return SizedBox(
      height: _height / 10.0,
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/apple.png', width: 25,),
            title: Text("Apple"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/banana.png', width: 25,),
            title: Text("Banana"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/coconut.png', width: 25,),
            title: Text("Coconut"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("$_nickName 님 안녕하세요."),
        ),
        body: Container(
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: bottomNavigator(context),
      ),
    );
  }
}

