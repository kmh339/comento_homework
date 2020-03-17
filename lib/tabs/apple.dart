import 'package:flutter/material.dart';

class Apple extends StatefulWidget {
  Apple({
    Key key,
  }) : super(key: key);

  @override
  _AppleState createState() => _AppleState();
}

class _AppleState extends State<Apple> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top:50, left: 20, right: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("???님 안녕하세요.", style: TextStyle(fontSize: 16),)
              ],
            )
          ),
        ),
      );
  }
}
