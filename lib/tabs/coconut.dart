import 'package:flutter/material.dart';

class Coconut extends StatefulWidget {
  Coconut({
    Key key,
  }) : super(key: key);

  @override
  _CoconutState createState() => _CoconutState();
}

class _CoconutState extends State<Coconut> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("hi"),
        ),
      ),
    );
  }
}
