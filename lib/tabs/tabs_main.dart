import 'package:comento_homework/tabs/apple_screen.dart';
import 'package:comento_homework/tabs/banana_screen.dart';
import 'package:comento_homework/tabs/coconut_screen.dart';
import 'package:flutter/material.dart';


class TabsMain extends StatefulWidget {
    TabsMain({
      Key key,
}) : super(key: key);

    State<TabsMain> createState() => _TabsMainState();
}

class _TabsMainState extends State<TabsMain>{
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      print(" _onItemTapped : $index");
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
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: bottomNavigator(context),
      ),
    );
  }
}

